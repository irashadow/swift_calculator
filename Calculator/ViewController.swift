//
//  ViewController.swift
//  Calculator
//
//  Created by Ivano on 6/27/16.
//  Copyright © 2016 Schaf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var display: UILabel!
    
    
    private var userIsInTheMiddleOfTyping = false
    
    //
    private var userIsInTheMiddleOfFloatingPointNummer = false
    

    
    
    @IBAction private func touchDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping{
            
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        }else{
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
        //print("touched \(digit) Digit")
    }
    
    private var displayValue: Double {
        get{
            return Double(display.text!)!
        }
        
        set {
            display.text = String(newValue)
        }
    }
    
    
    private var brain = CalculatorBrain()
    @IBAction private func performOperation(sender: UIButton) {
        
        if userIsInTheMiddleOfTyping{
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        if let mathmaticalSymbol = sender.currentTitle{
            brain.performOperation(mathmaticalSymbol)
        }
        
        displayValue = brain.result
        
    }
    
    
}

