//
//  SettingsViewController.swift
//  Prework-tip-calculator
//
//  Created by Kelsey Benjamin on 8/8/21.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var default_1: UITextField!
    @IBOutlet weak var default_2: UITextField!
    @IBOutlet weak var default_3: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func set_defaults(_ sender: Any) {
    
        //Set defaults to values
        let tip_1 = Int(default_1.text!) ?? 0
        let tip_2 = Int(default_2.text!) ?? 0
        let tip_3 = Int(default_3.text!) ?? 0
        
        defaults.set(tip_1, forKey: "tip_1")
        defaults.set(tip_2, forKey: "tip_2")
        defaults.set(tip_3, forKey: "tip_3")
        defaults.synchronize()

        default_1.text = ""
        default_2.text = ""
        default_3.text = ""
        
    }
}
