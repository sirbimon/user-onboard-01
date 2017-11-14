//
//  ViewController.swift
//  userCheckingPractice
//
//  Created by Bimonaretga on 11/13/17.
//  Copyright © 2017 moeCodes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var activitiesView: activitiesOnboardingView!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func textFieldChanged(_ sender: Any) {
        print(textField.text!)
        if textField.text == "" {
            activitiesView.animateLeft()
        } else {
            activitiesView.animateRight()
            activitiesView.explanationLabel.text = "So you're interested in \"\(textField.text ?? "dumbo")\" eh?"
        }
        
        
    }
    

}

