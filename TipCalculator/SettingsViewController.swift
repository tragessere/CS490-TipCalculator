//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Evan on 1/12/16.
//  Copyright © 2016 EvanTragesser. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var firstPercentageField: UITextField!
    @IBOutlet weak var secondPercentageField: UITextField!
    @IBOutlet weak var thirdPercentageField: UITextField!
    
    @IBOutlet weak var firstAnimationLabel: UILabel!
    @IBOutlet weak var secondAnimationLabel: UILabel!
    
    var firstPercentage: Int = 0
    var secondPercentage: Int = 0
    var thirdPercentage: Int = 0


    override func viewDidLoad() {
        super.viewDidLoad()

        //Load current user set percentages
        let defaults = NSUserDefaults.standardUserDefaults()
        firstPercentage = defaults.integerForKey(Constants.userFirst)
        secondPercentage = defaults.integerForKey(Constants.userSecond)
        thirdPercentage = defaults.integerForKey(Constants.userThird)
        
        
        //If the values haven't been set, use default values
        //(It is possible that the user could set the values to zero,
        // but why bother using the app then?)
        if firstPercentage == 0 {
            firstPercentage = Constants.defaultFirst
        }
        if secondPercentage == 0 {
            secondPercentage = Constants.defaultSecond
        }
        if thirdPercentage == 0 {
            thirdPercentage = Constants.defaultThird
        }
        
        firstPercentageField.text = "\(firstPercentage)"
        secondPercentageField.text = "\(secondPercentage)"
        thirdPercentageField.text = "\(thirdPercentage)"
        
        
    }
    
    @IBAction func onTapAnimate(sender: AnyObject) {
        let startAlphaOne = firstAnimationLabel.alpha
        let startAlphaTwo = secondAnimationLabel.alpha
        
        UIView.animateWithDuration(0.4, animations: {
            self.firstAnimationLabel.alpha = 1 - startAlphaOne
            self.secondAnimationLabel.alpha = 1 - startAlphaTwo
        })
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Save all user preferences when leaving view
    override func viewWillDisappear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(NSString(string: firstPercentageField.text!).integerValue, forKey: Constants.userFirst)
        defaults.setInteger(NSString(string: secondPercentageField.text!).integerValue, forKey: Constants.userSecond)
        defaults.setInteger(NSString(string: thirdPercentageField.text!).integerValue, forKey: Constants.userThird)
        defaults.synchronize()
    }
    

    @IBAction func onBackgroundTap(sender: AnyObject) {
        self.view.endEditing(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
