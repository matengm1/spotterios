//
//  ViewController.swift
//  Spotter
//
//  Created by Matt Eng on 1/16/16.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit
import Parse
import FBSDKCoreKit
import FBSDKLoginKit

class RegisterViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    @IBOutlet var UsernameTF: UITextField!
    @IBOutlet var PasswordTF: UITextField!
    @IBOutlet var EmailTF: UITextField!
    @IBOutlet var FacebookLoginButton: FBSDKLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("hello login world")
        
        if (FBSDKAccessToken.currentAccessToken() == nil)
        {
            print("Not logged in..")
        }
        else
        {
            print("Logged in..")
        }
        
        let FacebookLoginButton = FBSDKLoginButton()
        FacebookLoginButton.readPermissions = ["public_profile", "email", "user_friends"]
        
        FacebookLoginButton.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!)
    {
        if error == nil
        {
            print("Login complete.")
            self.performSegueWithIdentifier("showNew", sender: self)
        }
        else
        {
            print(error.localizedDescription)
        }
        
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!)
    {
        print("User logged out...")
    }
    

    @IBAction func registerButtonTouchUpInside(sender: UIButton) {
        print("hello guys this is a button")
        //Begin User Push
        var newError: NSError? = nil
        let user = PFUser()
        user.username = self.UsernameTF.text
        user.password = self.PasswordTF.text
        user.email = self.EmailTF.text
        
        // other fields can be set if you want to save more information
        //user["phone"] = "650-555-0000"
        
        user.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if error == nil {
                SptrConstants.currentUser = self.UsernameTF.text
                print(SptrConstants.currentUser)
                self.performSegueWithIdentifier("LoginSegue", sender: self)
            } else {
                print(error)
            }
        }

    }
}

