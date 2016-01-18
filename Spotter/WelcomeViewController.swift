
//
//  PreferencesViewController.swift
//  Spotter
//
//  Created by Matt Eng on 1/16/16.
//  Copyright © 2016 test. All rights reserved.
//

import Foundation
import UIKit
import Parse

class WelcomeViewController: UIViewController {
    @IBOutlet var switchCollection: [UISwitch]!
    
    @IBOutlet var welcomeUsername: UILabel!
    
    @IBAction func switchDataSubmitTouchUpInside(sender: UIButton) {
            let userPlanner = PFObject(className: "Planner")
            userPlanner["Cardio"] = switchCollection[0].on
            userPlanner["Weightlifting"] = switchCollection[1].on
            userPlanner["Exercise3"] = switchCollection[2].on
            userPlanner.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
                print("Object has been saved.")
            }
        print(switchCollection[0].on)
        print(switchCollection[1].on)
        
        
    }
    
    override func viewDidLoad(){
        
        self.welcomeUsername.text = "What are you doing today " + SptrConstants.currentUser! as String + "?"
        
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}