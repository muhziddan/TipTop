//
//  CalculatorLogic.swift
//  TipTop
//
//  Created by Muhammad Ziddan Hidayatullah on 18/05/22.
//

import Foundation

struct CalculatorLogic {
    
    var calculatorModel = CalculatorModel()
    
    mutating func calculateTip(tipValue input: String) {
        let convert = Double(input.dropLast())
        calculatorModel.tip = (convert ?? 0.0) / 100
    }
    
    func getTipPercentage() -> Int {
        let tipPercentage = Int(calculatorModel.tip * 100)
        return tipPercentage
    }
    
    mutating func setSplit(splitValue input: Double) {
        calculatorModel.split = Int(input)
    }
    
    func getSplit() -> String {
        return String(calculatorModel.split)
    }
    
    mutating func calculateTotalBill(bill: String) {
        
        guard let billDecimal = Double(bill) else {
            return
        }
        
        let totalBill = billDecimal * (1 + calculatorModel.tip)
        calculatorModel.result = round(totalBill / Double(calculatorModel.split) * 100) / 100
    }
    
    func getTotalBill() -> Double {
        return calculatorModel.result
    }
}
