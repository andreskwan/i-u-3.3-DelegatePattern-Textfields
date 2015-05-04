//
//  ZipCodeTextFieldDelegate.swift
//  TextFields
//
//  Created by Andres Kwan on 5/3/15.
//  Copyright (c) 2015 Udacity. All rights reserved.
//

import Foundation
import UIKit

class ZipCodeTextFieldDelegate: NSObject, UITextFieldDelegate {

    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        //to avoid bug - when paisting text in the uitextfield
        if(range.length + range.location > count(textField.text)){
            return false
        }
        if count(textField.text) + count(string) - range.length <= 5 {
            if (textField.keyboardType == UIKeyboardType.NumberPad){
                return isDigit(string)
            }
        }
        return false
    }
    
    func isDigit(string: String)->Bool{
        let decimalCharSet = NSCharacterSet.decimalDigitCharacterSet()
        let range = string.rangeOfCharacterFromSet(decimalCharSet)
        if (range != nil) {
            println("\(string) is a digit")
            println("range: \(range)")
            return true
        } else {
            println("\(string) is not a digit")
            return false
        }
    }
}
