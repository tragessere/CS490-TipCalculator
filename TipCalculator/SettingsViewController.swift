//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Evan on 1/12/16.
//  Copyright © 2016 EvanTragesser. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
    @IBOutlet weak var firstPercentageField: UITextField!
    @IBOutlet weak var secondPercentageField: UITextField!
    @IBOutlet weak var thirdPercentageField: UITextField!
    
    @IBOutlet weak var nightModeSwitch: UISwitch!
    
    @IBOutlet weak var firstAnimationLabel: UILabel!
    @IBOutlet weak var secondAnimationLabel: UILabel!
    
    //Remaining views are only here to be switched to night mode
    @IBOutlet var settingsTableView: UITableView!
    @IBOutlet weak var optionOneCell: UITableViewCell!
    @IBOutlet weak var optionOneLabel: UILabel!
    @IBOutlet weak var optionTwoCell: UITableViewCell!
    @IBOutlet weak var optionTwoLabel: UILabel!
    @IBOutlet weak var optionThreeCell: UIView!
    @IBOutlet weak var optionThreeLabel: UILabel!
    @IBOutlet weak var nightModeCell: UITableViewCell!
    @IBOutlet weak var nightModeLabel: UILabel!
    @IBOutlet weak var animationCell: UITableViewCell!
    @IBOutlet weak var animationButtonCell: UITableViewCell!
    
    var firstPercentage: Int = 0
    var secondPercentage: Int = 0
    var thirdPercentage: Int = 0

    var showAnimation: Bool = false;

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
        
        nightModeSwitch.setOn(defaults.boolForKey(Constants.userNight), animated: false)
        
        setNightMode()
    }
    
    @IBAction func onTapAnimate(sender: AnyObject) {
        let startAlphaOne = firstAnimationLabel.alpha
        let startAlphaTwo = secondAnimationLabel.alpha
        
        UIView.animateWithDuration(0.4, animations: {
            self.firstAnimationLabel.alpha = 1 - startAlphaOne
            self.secondAnimationLabel.alpha = 1 - startAlphaTwo
        })
    }
    
    
    @IBAction func onNightModeSwitched(sender: AnyObject) {
        setNightMode()
    }
    
    func setNightMode() {
        var animationDuration: Double = 0;
        
        if !showAnimation {
            showAnimation = true;
        } else {
            animationDuration = 0.4
        }
        
        UIView.animateWithDuration(animationDuration, animations:  {
        
        if self.nightModeSwitch.on {
            self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
            self.settingsTableView.backgroundColor = UIColor.blackColor()
            self.optionOneCell.backgroundColor = UIColor.darkGrayColor()
            self.optionOneLabel.textColor = UIColor.whiteColor()
            self.firstPercentageField.textColor = UIColor.lightGrayColor()
            self.firstPercentageField.keyboardAppearance = UIKeyboardAppearance.Dark
            self.optionTwoCell.backgroundColor = UIColor.darkGrayColor()
            self.optionTwoLabel.textColor = UIColor.whiteColor()
            self.secondPercentageField.textColor = UIColor.lightGrayColor()
            self.secondPercentageField.keyboardAppearance = UIKeyboardAppearance.Dark
            self.optionThreeCell.backgroundColor = UIColor.darkGrayColor()
            self.optionThreeLabel.textColor = UIColor.whiteColor()
            self.optionThreeLabel.backgroundColor = UIColor.darkGrayColor()
            self.thirdPercentageField.textColor = UIColor.lightGrayColor()
            self.thirdPercentageField.keyboardAppearance = UIKeyboardAppearance.Dark
            
            self.nightModeCell.backgroundColor = UIColor.darkGrayColor()
            self.nightModeLabel.textColor = UIColor.whiteColor()
            self.animationCell.backgroundColor = UIColor.darkGrayColor()
            self.firstAnimationLabel.textColor = UIColor.whiteColor()
            self.secondAnimationLabel.textColor = UIColor.whiteColor()
            self.animationButtonCell.backgroundColor = UIColor.darkGrayColor()
        } else {
            self.navigationController?.navigationBar.barStyle = .Default
            self.settingsTableView.backgroundColor = UIColor.groupTableViewBackgroundColor()
            self.optionOneCell.backgroundColor = UIColor.whiteColor()
            self.optionOneLabel.textColor = UIColor.darkTextColor()
            self.firstPercentageField.textColor = UIColor.darkGrayColor()
            self.firstPercentageField.keyboardAppearance = UIKeyboardAppearance.Default
            self.optionTwoCell.backgroundColor = UIColor.whiteColor()
            self.optionTwoLabel.textColor = UIColor.darkTextColor()
            self.secondPercentageField.textColor = UIColor.darkGrayColor()
            self.secondPercentageField.keyboardAppearance = UIKeyboardAppearance.Default
            self.optionThreeCell.backgroundColor = UIColor.whiteColor()
            self.optionThreeLabel.textColor = UIColor.darkTextColor()
            self.optionThreeLabel.backgroundColor = UIColor.whiteColor()
            self.thirdPercentageField.textColor = UIColor.darkGrayColor()
            self.thirdPercentageField.keyboardAppearance = UIKeyboardAppearance.Default
            
            self.nightModeCell.backgroundColor = UIColor.whiteColor()
            self.nightModeLabel.textColor = UIColor.darkTextColor()
            self.animationCell.backgroundColor = UIColor.whiteColor()
            self.firstAnimationLabel.textColor = UIColor.darkTextColor()
            self.secondAnimationLabel.textColor = UIColor.darkTextColor()
            self.animationButtonCell.backgroundColor = UIColor.whiteColor()
        }
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
        defaults.setBool(nightModeSwitch.on, forKey: Constants.userNight)
        defaults.synchronize()
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
