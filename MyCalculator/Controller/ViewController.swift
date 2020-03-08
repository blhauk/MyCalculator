//
//  ViewController.swift
//  MyCalculator
//
//  Created by Blair Haukedal on 2020-03-07.
//  Copyright © 2020 blhauk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum calcArrayTypes {
        case null
        case binaryOperator
        case number
    }
    
    private var isFinishedTypingNumber: Bool = true
    private var calcArrayLastType = calcArrayTypes.null
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else{
                fatalError("Cannot convert display label text to Double")
            }
            return number
        }
        
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func unaryOperator(_ sender: UIButton) {
        let label = sender.titleLabel?.text
        switch label {
        case "AC":
            displayValue = 0.0
            calcArray = []
            isFinishedTypingNumber = true
        case "+/-":
            displayValue *= -1
            isFinishedTypingNumber = true
        case "%":
            displayValue /= 100
            isFinishedTypingNumber = true
        default:
            displayValue = 1111
        }
        print("unaryOperator: \(label)")
    }
    
    @IBAction func binaryOperator(_ sender: UIButton) {
        let label = sender.titleLabel?.text
        isFinishedTypingNumber = true
        calcArray.append(displayLabel.text!)
        calcArrayLastType = calcArrayTypes.number
        var operater: String
        if label == "÷" {  // Convert to ASCII representatiom
             operater = "/"
        } else if label == "×" { // Convert to ASCII representatiom
             operater = "*"
        } else {
            operater = label! // Already ASCII
        }
        print("binaryOperator: \(operater)")
        if calcArrayLastType != calcArrayTypes.binaryOperator {
            calcArray.append(operater)
            calcArrayLastType = calcArrayTypes.binaryOperator
            isFinishedTypingNumber = true
            print(calcArray)
        }
    }
    
    @IBAction func assignOperator(_ sender: UIButton) {
        let label = sender.titleLabel?.text
        print("assignOperator: \(label)")
    }
    
    @IBAction func number(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else if numValue != "."  {
                displayLabel.text = displayLabel.text! + numValue
            } else if numValue == "." {
                if displayLabel.text!.contains(".") {
                    return
                } else {
                    displayLabel.text = displayLabel.text! + numValue
                }
            }
        }
        print("number: \(sender.titleLabel?.text)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

