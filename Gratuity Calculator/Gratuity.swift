//
//  Gratuity.swift
//  Gratuity Calculator
//
//  Created by Madden, Korey Michael on 9/5/18.
//  Copyright © 2018 Madden, Korey Michael. All rights reserved.
//

import Foundation

class Gratuity: NSObject {
    var tipPercent: NSDecimalNumber = 0
    var billAmount: NSDecimalNumber = 0
    
    var tipAmount: NSDecimalNumber {
        return tipPercent.multiplying(by: billAmount)
    }
    
    var totalBillAmount: NSDecimalNumber {
        return tipAmount.adding(billAmount)
    }
    
    init(tipPercent: NSDecimalNumber, billAmount: NSDecimalNumber){
        self.tipPercent = tipPercent
        self.billAmount = billAmount
    }
    
}
