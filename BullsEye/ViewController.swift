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
    var score = 0
    var round = 1

    @IBOutlet weak var roundLbl: UILabel!
    @IBOutlet weak var scoreLbl: UILabel!
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
        scoreLbl.text = "\(score)"
        roundLbl.text = "\(round)"
    }

    @IBAction func hitMeBtnIsPressed(_ sender: UIButton) {
        
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        score += points
        let message = "Your score \(points) points."
        let alert = UIAlertController(title: "Bull’s Eye", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ÄweSome", style: .default) { (action) in
            self.round += 1
            self.updateLabels()
            self.startNewRound()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        print("the value of slider is now: \(currentValue)" + "\nThe target value is: \(targetValue)" + "\n The difference is: \(difference)")
        
        
    }
    
    @IBAction func didSliderMoved(_ sender: UISlider) {
        print("the value of slider is now: \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func startOverBtnIsPressed(_ sender: UIButton) {
        score = 0
        round = 1
        startNewRound()
        updateLabels()
    }
}

