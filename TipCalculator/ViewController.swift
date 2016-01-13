//
//  ViewController.swift
//  TipCalculator
//
//  Created by Evan on 1/12/16.
//  Copyright © 2016 EvanTragesser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    var firstPercentage: Int = 0
    var secondPercentage: Int = 0
    var thirdPercentage: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        billField.becomeFirstResponder()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        //Update the tip values whenever the user types a new value to billField
        calculateTip()
    }

    //We want to load the user-defined percentages here instead of viewDidLoad() becase
    //this function will also be called when returning from the settings view.
    override func viewWillAppear(animated: Bool) {
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
        
        tipControl.setTitle("\(firstPercentage)%", forSegmentAtIndex: 0)
        tipControl.setTitle("\(secondPercentage)%", forSegmentAtIndex: 1)
        tipControl.setTitle("\(thirdPercentage)%", forSegmentAtIndex: 2)
        
        //Recalculate tips with the user's new percentage choices
        calculateTip()
    }
    
    func calculateTip() {
        var tipPercentages = [Double(firstPercentage) / 100.0,
            Double(secondPercentage) / 100.0,
            Double(thirdPercentage) / 100.0]
        
        let formatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentages[tipControl.selectedSegmentIndex]
        let total = billAmount + tip
        
        
        tipLabel.text = formatter.stringFromNumber(tip)
        totalLabel.text = formatter.stringFromNumber(total)
    }
    
	
    
    @IBAction func onTap(sender: AnyObject) {
        self.view.endEditing(true)
    }
}

