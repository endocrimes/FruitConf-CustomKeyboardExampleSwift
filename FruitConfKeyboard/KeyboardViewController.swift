//
//  KeyboardViewController.swift
//  FruitConfKeyboard
//
//  Created by  Danielle Lancashireon 11/06/2014.
//  Copyright (c) 2014 Danielle Lancashire. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton
    @IBOutlet var hodorButton: UIButton
    @IBOutlet var doneButton :UIButton

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Next Keyboard
        self.nextKeyboardButton = UIButton.buttonWithType(.System) as UIButton
    
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.setTranslatesAutoresizingMaskIntoConstraints(false)
    
        self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        var nextKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 5.0)
        var nextKeyboardButtonBottomConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint])
    
        // Done Button
        self.doneButton = UIButton.buttonWithType(.System) as UIButton
        
        self.doneButton.setTitle(NSLocalizedString("Done", comment: "Title for 'Dismiss Keyboard' button"), forState: .Normal)
        self.doneButton.sizeToFit()
        self.doneButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        self.doneButton.addTarget(self, action: "dismissKeyboard", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(self.doneButton)
        
        var doneButtonRightSideConstraint = NSLayoutConstraint(item: self.doneButton, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1.0, constant: -5.0)
        var doneButtonBottomConstraint = NSLayoutConstraint(item: self.doneButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([doneButtonRightSideConstraint, doneButtonBottomConstraint])
        
        // Hodor Button
        self.hodorButton = UIButton.buttonWithType(.System) as UIButton
        
        self.hodorButton.setTitle(NSLocalizedString("Hodor", comment: "Hodor button title!"), forState: .Normal)
        self.hodorButton.sizeToFit()
        self.hodorButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.hodorButton.addTarget(self, action: "insertHodor", forControlEvents: .TouchUpInside)
        self.hodorButton.font = UIFont(name: "HelveticaNeue", size: 24)
        
        self.view.addSubview(self.hodorButton)
        
        var hodorLeftSideConstraint = NSLayoutConstraint(item: self.hodorButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 5.0)
        var hodorTopSideConstraint = NSLayoutConstraint(item: self.hodorButton, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1.0, constant: 25.0)
        var hodorRightSideConstraint = NSLayoutConstraint(item: self.hodorButton, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1.0, constant: 5.0)
        
        self.view.addConstraints([hodorLeftSideConstraint, hodorTopSideConstraint, hodorRightSideConstraint])
    }
    
    func insertHodor() {
        var proxy = self.textDocumentProxy as UITextDocumentProxy
        proxy.insertText("Hodor ")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput) {
        // The app has just changed the document's contents, the document context has been updated.
    
        var textColor: UIColor
        var proxy = self.textDocumentProxy as UITextDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
        self.doneButton.setTitleColor(textColor, forState: .Normal)
        self.hodorButton.setTitleColor(textColor, forState: .Normal)
    }

}
