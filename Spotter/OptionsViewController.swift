//
//  OptionsViewController.swift
//  Spotter
//
//  Created by Matt Eng on 1/16/16.
//  Copyright © 2016 test. All rights reserved.
//

import Foundation
import UIKit
import Parse

class OptionsViewController: UIViewController {
    @IBOutlet var sliderCollection: [UISlider]!
    
    @IBAction func anySliderValueChanged(sender: UISlider) {
        //[slider setValue:((int)((slider.value + 2.5) / 5) * 5) animated:NO];
        //sender.setValue(((sender.value + 2.5) / 5) * 5), animated:false)
        //sender.setValue(Int(sender.value), animated: false)
    }
    
    @IBAction func uploadOptionDataTouchUpInside(sender: UIButton) {
        let userPreferences = PFObject(className: "Preferences")
        userPreferences["Cardio"] = Int(sliderCollection[0].value)
        userPreferences["Weightlifting"] = Int(sliderCollection[1].value)
        userPreferences["Exercise3"] = Int(sliderCollection[2].value)
        userPreferences.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
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