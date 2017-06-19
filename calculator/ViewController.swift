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
    private var brain = CalculatorBrain()
    
    @IBAction func performOperation(_ sender: UIButton) {
        if(!firstSymbol){
        brain.setOperand(displayValue)
        if let operation = sender.currentTitle{
             brain.performOperation(operation)
            }
        if let result = brain.result{
              displayValue=result
            }
        }
    }
    
}

