//
//  ViewController.swift
//  Homework for ios
//
//  Created by Maxim Stegnienko on 12/10/2016.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var display: UILabel!
    
    private var userStartedTyping = false
    
    private let calculator = Calculator()
    
    private var pointIsUse = false
    
    var displayedNumber: Double {
        get {
            return Double(display.text!) ?? 0.0
        }
        
        set {
            display.text = String(newValue)
            calculator.setNumber(number: newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func resetButtonPressed(_ sender: AnyObject) {
        display.text = "0"
        userStartedTyping = false
        calculator.setNumber(number: displayedNumber)
    }
    
    @IBAction func operationButtonPressed(_ sender: AnyObject) {
        guard let button = sender as? UIButton else {
            return
        }
        
        guard let op = button.currentTitle else {
            return
        }
        
        displayedNumber = calculator.performOperation(operation: op)
        userStartedTyping = false
    }
    
    
    @IBAction func numberButtonPressed(_ sender: AnyObject) {
        guard let button = sender as? UIButton else {
            return
        }

        guard let currentText = display.text, let number = button.currentTitle else {
            return
        }
      
    
        if userStartedTyping {
       
            
         // Здесь начинается пунтк номер 4
            
            let textOnDisplay = display.text!
            
            if (number != ".") || ((textOnDisplay.range(of: ".") == nil)) {
                
                display.text = currentText + number
                
            }
            
         //Изначально я сделал так как написано ниже , но потом решил воспользоватья
        // функций rangeofstring
            
            /*
            if (number == ".") && (pointIsUse == false) {
                
                display.text = currentText + number
                pointIsUse = true
                
            }
            
            if (number != ".") && (pointIsUse == true) {
                display.text = currentText + number
    
            }
            
            if (number != ".") && (pointIsUse == false) {
                
                display.text = currentText + number
                
            }
 
 */
            
            
            // здесь заканчивается пункт номер 4
          
        } else {
            display.text = number
        }
        
        calculator.setNumber(number: displayedNumber)
        userStartedTyping = true
    }
}

