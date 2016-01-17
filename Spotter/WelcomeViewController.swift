
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
    
    @IBAction func switchDataSubmitTouchUpInside(sender: UIButton) {
            let userPlanner = PFObject(className: "Planner")
            userPlanner["Cardio"] = switchCollection[0]
            userPlanner["Weightlifting"] = switchCollection[1]
            userPlanner["Exercise3"] = switchCollection[2]
            userPlanner.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
                print("Object has been saved.")
            }
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}