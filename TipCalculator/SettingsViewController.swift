//
//  SettingsViewController.swift
//  TipTap
//
//  Created by Denzel Ketter on 12/31/15.
//  Copyright © 2015 CodePath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var lowerTipField: UITextField!
    @IBOutlet weak var averageTipField: UITextField!
    @IBOutlet weak var higherTipField: UITextField!
    
    let customTip = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
        
    @IBAction func sethigherTipFieldButton(sender: AnyObject) {
        customTip.setObject(higherTipField.text, forKey: "one")

        }
        
    }
        

