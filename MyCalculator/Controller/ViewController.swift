//
//  ViewController.swift
//  MyCalculator
//
//  Created by Blair Haukedal on 2020-03-07.
//  Copyright © 2020 blhauk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var isFinishedTypingNumber: Bool = true
    private var calcArrayLastType = calcArrayTypes.null
    private var numAppended:  Bool = false
    
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
            calcArrayLastType = calcArrayTypes.null
            isFinishedTypingNumber = true
        case "+/-":
            displayValue *= -1
            calcArray.append(String(displayValue))
            numAppended  = true
            calcArrayLastType = calcArrayTypes.number
            isFinishedTypingNumber = true
        case "%":
            displayValue /= 100
            calcArray.append(String(displayValue))
            numAppended  = true
            calcArrayLastType = calcArrayTypes.number
            isFinishedTypingNumber = true
        default:
            displayValue = 1111
        }
        print("unaryOperator: \(label)")
        print(calcArray)
    }
    
    @IBAction func binaryOperator(_ sender: UIButton) {
        let label = sender.titleLabel?.text
        var operater: String
        
        if calcArrayLastType == calcArrayTypes.binaryOperator {
            let index = calcArray.count - 1
            let oldbinaryOperator = calcArray[index]
            calcArray[index] = label!
            print("Changing binaryOperator from \(oldbinaryOperator) to \(label!)")
            print(calcArray)
            return
        }
        
        isFinishedTypingNumber = true
        if !numAppended {
            calcArray.append(displayLabel.text!)
            numAppended = true
            calcArrayLastType = calcArrayTypes.number
        }
        
        if label == "÷" {  // Convert to ASCII representatiom
             operater = "/"
        } else if label == "×" { // Convert to ASCII representatiom
             operater = "*"
        } else {
            operater = label! // Already ASCII
        }
        
        print("binaryOperator: \(operater)")
        calcArray.append(operater)
        calcArrayLastType = calcArrayTypes.binaryOperator
        isFinishedTypingNumber = true
        numAppended = false
        print(calcArray)
    }
    
    @IBAction func assignOperator(_ sender: UIButton) {
        let label = sender.titleLabel?.text
        print(label)
        if !numAppended {
              calcArray.append(displayLabel.text!)
              numAppended = true
              calcArrayLastType = calcArrayTypes.number
        }

        let rpnArray = getRPNArray(calcArray)
        let result = getResultFromRPNarray(rpnArray)

        print("calcArray: \(calcArray)")
        print("rpnArray: \(rpnArray)")
        print("result: \(result)")
        displayLabel.text = String(result)
        
        // This works, but will append a number to calcArray if numkey is pressed next
        // (RPNArray ignores first elemnt as a result is returned without using first element)
        calcArray = [displayLabel.text!]
        calcArrayLastType = calcArrayTypes.null
        isFinishedTypingNumber = true
    }
    
    @IBAction func number(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                calcArrayLastType = calcArrayTypes.number
                numAppended = false
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

