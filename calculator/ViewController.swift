//
//  ViewController.swift
//  calculator
//
//  Created by Hamlet on 04/06/2017.
//  Copyright © 2017 Hamlet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var displayValue: Double{
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    var firstSymbol = true
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if firstSymbol
        {
            if (digit != "0") {
                firstSymbol=false
                display.text=digit
            }
        }else
        {
            display.text=display.text! + digit
        }
    }
    @IBAction func performOperation(_ sender: UIButton) {
        firstSymbol=true
        
        let operation = sender.currentTitle!
        switch operation {
        case "√":
            displayValue = sqrt(displayValue)
        case "π":
            displayValue = Double.pi
        default:
            break
        }
        
    }
    
}

