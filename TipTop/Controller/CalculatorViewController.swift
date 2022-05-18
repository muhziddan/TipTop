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
    
    var calculatorLogic = CalculatorLogic()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPercentageButton.isSelected = false
        tenPercentageButton.isSelected = false
        twentyPercentageButton.isSelected = false
        
        billTextField.endEditing(true)
        
        sender.isSelected = true
        
        guard let labelText = sender.titleLabel?.text else {
            return
        }
        
        calculatorLogic.calculateTip(tipValue: labelText)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        calculatorLogic.setSplit(splitValue: sender.value)
        splitNumberLabel.text = calculatorLogic.getSplit()
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        guard let bill = billTextField.text else {
            return
        }
        
        calculatorLogic.calculateTotalBill(bill: bill)
        
        performSegue(withIdentifier: "goToResultsVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResultsVC" {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.calculated = calculatorLogic.getTotalBill()
            destinationVC.split = calculatorLogic.getSplit()
            destinationVC.tip = calculatorLogic.getTipPercentage()
        }
    }
}
