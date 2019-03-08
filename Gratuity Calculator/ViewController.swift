//
//  ViewController.swift
//  Gratuity Calculator
//
//  Created by Madden, Korey Michael on 8/29/18.
//  Copyright © 2018 Madden, Korey Michael. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Declare IBOUTLETS
    @IBOutlet var lblTipPercentOutput: UILabel!
    @IBOutlet var lblTipAmountOutput: UILabel!
    @IBOutlet var lblTotalAmountOutput: UILabel!
    
    // DECLARE ATTRIBUTES
    var gratuityCalc = Gratuity(tipPercent: 0.15, billAmount: 0.00)
    
    
    // LIFECYCLE FUNCTIONS

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // ALLOW USER TO DISMISS THE KEYBOARD
        
        //Create an object that recognizes taps
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        
        //Needed so we don't interfere with other tap controls
        tap.cancelsTouchesInView = false
        
        // Adds the tap object to the current view
        self.view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Define IBACTIONS
    
    @IBAction func txtBillAmountUpdated(_ sender: UITextView) {
        print("Bill Amount Updated!")
        print("The bill amount is \(sender.text)")
        //var currentBill = sender.text
        //Get bill amount to use in gratuityCalc() below
        
        //Collect the value of the text field
        gratuityCalc.billAmount = NSDecimalNumber(string: sender.text)
        
        updateTipAndTotal()
    }
    
    @IBAction func slideTipPercentUpdated(_ sender: UISlider) {
        print("Tip Percentage Updated!")
        print("Slider value is \(sender.value)")
        
        let sliderValue = NSDecimalNumber(value: sender.value)
        
        
        let roundingBehavior = NSDecimalNumberHandler(roundingMode: .plain, scale: 2, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
        
        
        gratuityCalc.tipPercent = sliderValue.rounding(accordingToBehavior: roundingBehavior)
        
        //update gratuity
        //gratuityCalc.tipPercent = NSDecimalNumber(value: sender.value)
        
        //??
        
        print("slider value is now \(gratuityCalc.tipPercent)")
        
        let percentFormatter = NumberFormatter()
        percentFormatter.numberStyle = .percent
        percentFormatter.maximumFractionDigits = 0
        
        //lblTipPercentOutput.text = "\(gratuityCalc.tipPercent)"
        
        lblTipPercentOutput.text = percentFormatter.string(from: gratuityCalc.tipPercent)
        
        updateTipAndTotal()
        
        //let currentValue = Int(sender.value)
        //lblTipPercentOutput.text = "\(currentValue)%"
        // Does not update value?
        //print(currentValue)
        //var gratuityCalc = Gratuity(tipPercent: currentValue, billAmount: currentBill)
        //Running gratuityCalc() should update the total bill amount when ran correctly
    }
    
    func updateTipAndTotal() {
        //Display the updated values for tip amount and total amount
        
        var tipAmount = gratuityCalc.tipAmount
        var totalBillAmount = gratuityCalc.totalBillAmount
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        
        lblTipAmountOutput.text = currencyFormatter.string(from: tipAmount)
        lblTotalAmountOutput.text = currencyFormatter.string(from: totalBillAmount)
    }
    
    

}

