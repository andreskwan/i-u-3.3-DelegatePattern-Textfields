//
//  CurrencyTextfieldDelegate.swift
//  TextFields
//
//  Created by Andres Kwan on 5/5/15.
//  Copyright (c) 2015 Udacity. All rights reserved.
//

import Foundation
import UIKit

class CurrencyTextfieldDelegate: NSObject, UITextFieldDelegate {
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        var numberStr : String = ""
        
        if (textField.keyboardType == UIKeyboardType.NumberPad) && isDigit(string){
            var oldText = textField.text as NSString

            //play with the range
            var newText = oldText.stringByReplacingCharactersInRange(range, withString: string)
            numberStr = newText as String
            
            let digits = NSCharacterSet.decimalDigitCharacterSet()
            var digitText = ""
            for c in numberStr.unicodeScalars {
                if digits.longCharacterIsMember(c.value) {
                    digitText.append(c)
                }
            }
            if let numberOfPennies = digitText.toInt() {
                newText = "$" + self.dollarStringFromInt(numberOfPennies) + "." + self.centsStringFromInt(numberOfPennies)
            } else {
                newText = "$0.00"
            }
            textField.text = newText
            return false;
        }else{
            println("is not a NumberPad keyboard or is not a digit")
        }
        return false
    }

    func isDigit(string: String)->Bool{
        let decimalCharSet = NSCharacterSet.decimalDigitCharacterSet()
        let range = string.rangeOfCharacterFromSet(decimalCharSet)
        if (range != nil) {
            return true
        } else {
            return false
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true;
    }
    
    func dollarStringFromInt(value: Int) -> String {
        return String(value / 100)
    }
    
    func centsStringFromInt(value: Int) -> String {
        
        let cents = value % 100
        var centsString = String(cents)
        
        if cents < 10 {
            centsString = "0" + centsString
        }
        
        return centsString
    }

}
