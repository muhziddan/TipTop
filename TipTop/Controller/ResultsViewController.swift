//
//  ResultsViewController.swift
//  TipTop
//
//  Created by Muhammad Ziddan Hidayatullah on 17/05/22.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var calculated: Double?
    var split: Int?
    var tip: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        totalLabel.text = String(calculated ?? 0.0)
        descriptionLabel.text = "Split between \(split ?? 0) people, with \(tip ?? 0)% tip"
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
