//
//  ViewController.swift
//  Spotter
//
//  Created by Matt Eng on 1/16/16.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    @IBOutlet var UsernameTextField: UITextField!
    @IBOutlet var PasswordTF: UITextField!
    @IBOutlet var EmailTF: UITextField!
    @IBOutlet var SubmitButton: UIButton!
    override func viewDidLoad() {
        let user = PFUser()
        user.username = "my name"
        user.password = "my pass"
        user.email = "email@example.com"
        
        // other fields can be set if you want to save more information
        user["phone"] = "650-555-0000"

        user.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if error == nil {
                // Hooray! Let them use the app now.
            } else {
                // Examine the error object and inform the user.
            }
        }
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

