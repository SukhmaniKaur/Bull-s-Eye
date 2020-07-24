//
//  ViewController.swift
//  BullsEye
//
//  Created by MACBOOK on 23/07/20.
//  Copyright © 2020 SukhmaniKaur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 1
    var targetValue: Int = 0

    @IBOutlet weak var targetLbl: UILabel!
    @IBOutlet weak var slider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        updateLabels()
        // Do any additional setup after loading the view.
    }
    
    func startNewRound() {
        currentValue = 50
        targetValue = Int.random(in: 1...100)
        slider.value = Float(currentValue)
    }
    
    func updateLabels() {
        targetLbl.text = "\(targetValue)"
    }

    @IBAction func hitMeBtnIsPressed(_ sender: UIButton) {
        let difference = abs(targetValue - currentValue)
        let alert = UIAlertController(title: "Hello World!", message: "the value of slider is now: \(currentValue)" + "\nThe target value is: \(targetValue)" + "\n The difference is: \(difference)", preferredStyle: .alert)
        let action = UIAlertAction(title: "ÄweSome", style: .default) { (action) in
            self.updateLabels()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
        
    }
    
    @IBAction func didSliderMoved(_ sender: UISlider) {
        print("the value of slider is now: \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
}

