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
    @IBOutlet weak var heartRateButton: UIButton!
    @IBOutlet weak var heartRateLabel: UILabel!
    
    @IBAction func unwindSegueToHRViewController(segue: UIStoryboardSegue) {
        guard segue.identifier == "unwindSegueToHRVC" else { return }
    }
    
    @IBAction func actionBegin(_ sender: UIButton) {
        text = ""
        heartRateTextView.text = text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func heartRateUpdated(to bpm: Int) {
        text += "The most recent heart rate reading is \(String(bpm))\n"
        DispatchQueue.main.async {
            self.heartRateLabel.text = " ❤️ \(String(bpm))"
            self.heartRateTextView.text = self.text
        }
        print("The user has been shown a heart rate of \(bpm).")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let hrr = segue.destination as? HeartRateReceiver else { return }
        hrr.delegate = self
    }

}
