//
//  ViewController.swift
//  TipTop
//
//  Created by Muhammad Ziddan Hidayatullah on 12/05/22.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPercentageButton: UIButton!
    @IBOutlet weak var tenPercentageButton: UIButton!
    @IBOutlet weak var twentyPercentageButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var value: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPercentageButton.isSelected = false
        tenPercentageButton.isSelected = false
        twentyPercentageButton.isSelected = false
        
        sender.isSelected = true
        
        let buttonTitle = sender.titleLabel?.text?.dropLast()
        
        let number = Double(buttonTitle ?? "0.0")
        
        value = (number ?? 0.0) / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(value ?? 0.0)
    }
}
