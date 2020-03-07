//
//  ViewController.swift
//  MyCalculator
//
//  Created by Blair Haukedal on 2020-03-07.
//  Copyright © 2020 blhauk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayLabel: UILabel!
    
    // Change to unaryOperator, binaryOperator and assignOperator buttons
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        let label = sender.titleLabel?.text
        var operater: String
        if label == "÷" {  // Convert to ASCII representatiom
             operater = "/"
        } else if label == "×" { // Convert to ASCII representatiom
             operater = "*"
        } else {
            operater = label! // Already ASCII
        }
        print("calcButtonPressed: \(operater)")
    }


    @IBAction func numButtonPressed(_ sender: UIButton) {
        print("numButtonPressed: \(sender.titleLabel?.text)")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

