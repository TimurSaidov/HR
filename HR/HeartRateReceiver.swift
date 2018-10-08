//
//  HeartRateReceiver.swift
//  HR
//
//  Created by Timur Saidov on 07/10/2018.
//  Copyright © 2018 Timur Saidov. All rights reserved.
//

import UIKit

protocol HeartRateReceiverDelegate {
    func heartRateUpdated(to bpm: Int)
}

class HeartRateReceiver: UIViewController {
    
    var delegate: HeartRateReceiverDelegate?
    
    var currentHR: Int? {
        didSet {
            if let currentHR = currentHR {
                delegate?.heartRateUpdated(to: currentHR)
                print("The most recent heart rate reading is \(currentHR).")
            } else {
                print("Looks like we can't pick up a heart rate.")
            }
        }
    }

    @IBAction func startAction(_ sender: UIButton) {
        DispatchQueue.global().async {
            self.startHeartRateMonitoringExample()
        }
//        performSegue(withIdentifier: "unwindSegueToHRVC", sender: sender)
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never
    }
    
    func startHeartRateMonitoringExample() {
        guard let hrvc = delegate as? HeartRateViewController else { return }
        DispatchQueue.main.async {
            hrvc.heartRateButton.isUserInteractionEnabled = false
            hrvc.heartRateButton.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
        for _ in 1...10 {
            let randomHR = 60 + Int(arc4random_uniform(UInt32(15)))
            currentHR = randomHR
            Thread.sleep(forTimeInterval: 2)
        }
        DispatchQueue.main.async {
            hrvc.heartRateButton.isUserInteractionEnabled = true
            hrvc.heartRateButton.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        }
    }
    
}
