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
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        print("calcButtonPressed: \(sender.titleLabel?.text)")
    }


    @IBAction func numButtonPressed(_ sender: UIButton) {
        print("numButtonPressed: \(sender.titleLabel?.text)")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

