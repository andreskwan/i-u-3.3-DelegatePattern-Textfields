//
//  ViewController.swift
//  TextFields
//
//  Created by Jason on 11/11/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // Outlets
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var characterCountLabel: UILabel!
    @IBOutlet weak var writeControl: UISwitch!
    //
    var isWriteEnable = false
    
    // Text Field Delegate objects
    let emojiDelegate = EmojiTextFieldDelegate()
    let colorizerDelegate   = ColorizerTextFieldDelegate()
    //
    let randomColorDelegate = RandomColorTextFieldDelegate()
    let zipCodeDelegate     = ZipCodeTextFieldDelegate()
    let currencyDelegate    = CurrencyTextfieldDelegate()
    
    // Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // set the label to be hidden
        self.characterCountLabel.hidden = true
        
        // Set the three delegates
        self.textField1.delegate = zipCodeDelegate
        self.textField2.delegate = currencyDelegate
        self.textField3.delegate = self
        
        self.textField2.text     = "$0.00"
        self.isWriteEnable       = false
        writeControl.on          = self.isWriteEnable
        self.textField3.placeholder = "Edit by turning on"
    }
    
    @IBAction func enableWriteOnTextField(sender: UISwitch) {
        isWriteEnable = writeControl.on ? true : false
        if writeControl.on {
            isWriteEnable = true
            self.textField3.placeholder = "Start to edit"
        }else{
            isWriteEnable = false
            self.textField3.placeholder = "Edit by turning on"
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
    
        if isWriteEnable {
        // Figure out what the new text will be, if we return true
        var newText: NSString = textField.text
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        
        // hide the label if the newText will be an empty string
        self.characterCountLabel.hidden = (newText.length == 0)
        
        // Write the length of newText into the label
        self.characterCountLabel.text = String(newText.length)
        
        // returning true gives the text field permission to change its text
        return true;
        }
        return false
    }
    func textFieldDidEndEditing(textField: UITextField) {
        var finalText : NSString = self.textField3.text
        self.characterCountLabel.text = "Total: " + String(finalText.length)
    }
}