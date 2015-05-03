//
//  RandomColorTextFieldDelegate.swift
//  TextFields
//
//  Created by Andres Kwan on 5/3/15.
//  Copyright (c) 2015 Udacity. All rights reserved.
//

import Foundation
import UIKit

class RandomColorTextFieldDelegate: NSObject, UITextFieldDelegate {
    // Text Field Delegate Methods
    // how to identify the obj that send the message? 
    // is self? 
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        // Figure out what the new text will be, if we return true
        var newText: NSString = textField.text
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        
        // hide the label if the newText will be an empty string
//        self.characterCountLabel.hidden = (newText.length == 0)
        
        // Write the length of newText into the label
//        self.characterCountLabel.text = String(newText.length)
        
        // returning true gives the text field permission to change its text
        return true;
    }
    func textFieldDidEndEditing(textField: UITextField) {
        var finalText : NSString = textField.text
        textField.text = textField.text + " | Total: " + String(finalText.length)
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = ""
    }
}
