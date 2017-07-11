//
//  ViewController.swift
//  AimForThat2017
//
//  Created by Arturo on 5/7/17.
//  Copyright © 2017 Kenkozu. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.currentValue = lroundf(slider.value)
        self.targetValue = 1 + Int(arc4random_uniform(100))
        self.targetLabel.text = "\(targetValue)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        let message = "Slider's value is \(self.currentValue)"
        let alert = UIAlertController(title: "Title", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        self.currentValue = lroundf(sender.value)
    }
}

