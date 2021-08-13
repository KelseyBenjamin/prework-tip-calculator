//  ViewController.swift
//  Prework-tip-calculator
//
//  Created by Kelsey Benjamin on 8/6/21.
//

import UIKit
let defaults = UserDefaults.standard

class ViewController: UIViewController {

    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Sets the title in the Navigation Bar
        self.title = "Tip Calculator"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        
        // Get defaults or set initial [5, 10, 15]
        if defaults.integer(forKey: "tip_1") != 0 {
            let tip_1 = defaults.integer(forKey: "tip_1")
            tipControl.setTitle(String(tip_1), forSegmentAt: 0)
        }
        else{
            tipControl.setTitle(String(5), forSegmentAt: 0)
        }
        
        if defaults.integer(forKey: "tip_2") != 0 {
            let tip_2 = defaults.integer(forKey: "tip_2")
            tipControl.setTitle(String(tip_2), forSegmentAt: 1)
        }
        else{
            tipControl.setTitle(String(10), forSegmentAt: 1)
        }
        
        if defaults.integer(forKey: "tip_3") != 0 {
            let tip_3 = defaults.integer(forKey: "tip_3")
            tipControl.setTitle(String(tip_3), forSegmentAt: 2)
        }
        else{
            tipControl.setTitle(String(15), forSegmentAt: 2)
        }
        

        if defaults.bool(forKey: "darkmode") == true {
            overrideUserInterfaceStyle = .dark
        }
        else{
            overrideUserInterfaceStyle = .light
        }
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billAmountTextField.becomeFirstResponder()
    
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        //Get bill amount from text input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        
        let first_tip:Double = Double(tipControl.titleForSegment(at: 0)!)!
        let second_tip:Double = Double(tipControl.titleForSegment(at: 1)!)!
        let third_tip:Double = Double(tipControl.titleForSegment(at: 2)!)!
        
        //Get Total tip by multiplying tip * tipPercentage
        let tipPercentages = [first_tip/100, second_tip/100, third_tip/100]
        
        let tip = bill * Double(tipPercentages[tipControl.selectedSegmentIndex])
        let total = bill + tip
        
        //Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        //Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    

}

