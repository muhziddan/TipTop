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
    
//    var bill: Double?
    var tip: Double?
    var split: Int = 1
    var result: Double?

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPercentageButton.isSelected = false
        tenPercentageButton.isSelected = false
        twentyPercentageButton.isSelected = false
        billTextField.endEditing(true)
        
        sender.isSelected = true
        
        let buttonTitle = sender.titleLabel?.text?.dropLast()
        
        let number = Double(buttonTitle ?? "0.0")
        
        tip = (number ?? 0.0) / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        split = Int(sender.value)
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        guard let bill = billTextField.text else {
            return
        }
        
        guard let billDecimal = Double(bill) else {
            return
        }
        
        let totalBill = billDecimal * (1 + (tip ?? 0.0))
        result = round(totalBill / Double(split) * 100) / 100
        
        performSegue(withIdentifier: "goToResultsVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResultsVC" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.calculated = result
            destinationVC.split = split
            destinationVC.tip = Int((tip ?? 0.0) * 100)
        }
    }
}
