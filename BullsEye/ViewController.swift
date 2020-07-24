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
        sliderConfig()
        // Do any additional setup after loading the view.
    }
    
    func sliderConfig() {
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)

        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)

        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)

        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable =
                         trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)

        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable =
                         trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
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
    
    @IBAction func infoBtnIsPressed(_ sender: UIButton) {
        let MAIN = UIStoryboard(name: "Main", bundle: nil)
        let vc = MAIN.instantiateViewController(withIdentifier: "AboutVC") as! AboutVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

