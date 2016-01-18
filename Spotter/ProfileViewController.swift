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
class ProfileViewController: UIViewController {
    @IBOutlet var profileName: UILabel!
    @IBOutlet var exercise3Label: UILabel!
    @IBOutlet var weightliftingLabel: UILabel!
    @IBOutlet var cardioRating: UILabel!
    
    override func viewDidLoad(){
        
//        var query = PFQuery(className: "YourClassName")
//        query.orderByDescending("createdAt")
//        query.getFirstObjectInBackgroundWithBlock {(object: PFObject?, error: NSError?) -> Void in
//            // code
//        }
        
        var query = PFQuery(className:"_User")
        query.orderByAscending("username")
        query.getFirstObjectInBackgroundWithBlock {(object: PFObject?, error: NSError?) -> Void in
            if error == nil && object != nil {
                if let userInfo = object {
                    self.profileName.text = userInfo.objectForKey("username") as! String
                }
            } else {
                print(error)
            }
        }
        
        var preferences = PFQuery(className:"Preferences")
        preferences.orderByDescending("Cardio")
        preferences.getFirstObjectInBackgroundWithBlock {(object: PFObject?, error: NSError?) -> Void in
            if error == nil && object != nil {
                if let userInfo = object {
                    self.cardioRating.text = userInfo.objectForKey("Cardio") as? String
                    self.weightliftingLabel.text = userInfo.objectForKey("Weightlifting") as? String
                    self.exercise3Label.text = userInfo.objectForKey("Exercise3") as? String
                }
            } else {
                print(error)
            }
        }
        
        
        
        
        
//        query.getFirstObjectInBackgroundWithBlock {
//            (listedUsers: PFObject?, error: NSError?) -> Void in
//            if error == nil && listedUsers != nil {
//                print(listedUsers)
//            } else {
//                print(error)
//            }
//        }
        
        
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}