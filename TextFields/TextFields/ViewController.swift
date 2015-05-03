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
    
    // Text Field Delegate objects
    let emojiDelegate = EmojiTextFieldDelegate()
    let colorizerDelegate = ColorizerTextFieldDelegate()
    //
    let randomColorDelegate = RandomColorTextFieldDelegate()
    // Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // set the label to be hidden
        self.characterCountLabel.hidden = true
        
        // Set the three delegates
        self.textField1.delegate = emojiDelegate
        self.textField2.delegate = colorizerDelegate
        self.textField3.delegate = randomColorDelegate
    }
}

