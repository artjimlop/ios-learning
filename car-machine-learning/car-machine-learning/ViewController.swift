//
//  ViewController.swift
//  car-machine-learning
//
//  Created by Arturo on 3/7/17.
//  Copyright © 2017 Kenkozu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var modelSegmentedControl: UISegmentedControl!
    @IBOutlet weak var extrasSwitch: UISwitch!
    @IBOutlet weak var kmsLable: UILabel!
    @IBOutlet weak var kmsSlider: UISlider!
    @IBOutlet weak var statusSegmentedControl: UISegmentedControl!
    @IBOutlet weak var priceLabel: UILabel!
    
    let cars = Cars()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.calculateValue()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func calculateValue() {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        let formattedKms = formatter.string(for: self.kmsSlider.value) ?? "0"
        self.kmsLable.text = "It has: \(formattedKms) kms"
        
        if let prediction = try? cars.prediction(
            modelo: Double(self.modelSegmentedControl.selectedSegmentIndex),
            extras: self.extrasSwitch.isOn ? Double(1.0) : Double(0.0),
            kilometraje: Double(self.kmsSlider.value),
            estado: Double(self.statusSegmentedControl.selectedSegmentIndex )) {
            
            let clampValue = max(500, prediction.price)
            
            formatter.numberStyle = .currency
            
            self.priceLabel.text = formatter.string(for: clampValue)
        } else {
            self.priceLabel.text = "Error"
        }
    }
}

