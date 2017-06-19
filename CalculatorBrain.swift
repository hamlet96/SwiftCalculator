//
//  CalculatorBrain.swift
//  calculator
//
//  Created by Hamlet on 19/06/2017.
//  Copyright © 2017 Hamlet. All rights reserved.
//

import Foundation

func changeSign(operand: Double) -> Double{
    return -operand
}

struct CalculatorBrain{
    private var accumulator:Double?
    
    private enum Operation{
        case constant(Double)
        case unaryOperation((Double)->Double)
    }
    private var operations: Dictionary<String,Operation> =
    [
     "π" : Operation.constant(Double.pi),
     "e" : Operation.constant(M_E),
     "√" : Operation.unaryOperation(sqrt),
     "cos": Operation.unaryOperation(cos),
     "±": Operation.unaryOperation(changeSign)
     
    ]
    
    mutating func performOperation(_ symbol: String){
        if let operation = operations[symbol]{
            switch operation {
            case .constant(let value):
             accumulator=value
            case .unaryOperation(let function):
                accumulator=function(accumulator!)
            }
        }
    }
    
    mutating func setOperand(_ operand:Double){
     accumulator=operand
    }
    var result:Double?{
        get{
            return accumulator
        }
    }
}
