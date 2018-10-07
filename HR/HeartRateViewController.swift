//
//  HeartRateViewController.swift
//  HR
//
//  Created by Timur Saidov on 07/10/2018.
//  Copyright © 2018 Timur Saidov. All rights reserved.
//

import UIKit

class HeartRateViewController: UIViewController, HeartRateReceiverDelegate {
    
    var text: String = ""
    
    @IBOutlet weak var heartRateTextView: UITextView!
    
    @IBAction func unwindSegueToHRViewController(segue: UIStoryboardSegue) {
        guard segue.identifier == "unwindSegueToHRVC" else { return }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func heartRateUpdated(to bpm: Int) {
        text += "The most recent heart rate reading is \(String(bpm))\n"
        DispatchQueue.main.async {
            self.heartRateTextView.text = self.text
        }
        print("The user has been shown a heart rate of \(bpm).")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let hrr = segue.destination as? HeartRateReceiver else { return }
        hrr.delegate = self
    }

}
