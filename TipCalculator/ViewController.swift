//
//  ViewController.swift
//  TipTap
//
//  Created by Denzel Ketter on 12/24/15.
//  Copyright © 2015 CodePath. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var totalTextField : UITextField!
    @IBOutlet var taxPctSlider : UISlider!
    @IBOutlet var taxPctLabel : UILabel!
    @IBOutlet var clearButton : UIButton!
    @IBOutlet var resultsTextView : UITextView!
    @IBOutlet weak var tableView: UITableView!
    
    

    let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.06)
    var possibleTips = Dictionary<Int, (tipAmt:Double, total:Double)>()
    var sortedtipValue:[Int] = []
    
    func refreshUI() {
    // 1
    totalTextField.text = String(format: "%0.2f", tipCalc.total)
    
    // 2
    taxPctSlider.value = Float(tipCalc.taxPct) * 100.0
    
    // 3
    taxPctLabel.text = "Tax Percentage is (\(Int(taxPctSlider.value))%)"

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        totalTextField.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
        
    @IBAction func clearTotalAmount (sender : AnyObject) {
        totalTextField.text = ""
        calculateTapped( sender )
    
    }
    
    @IBAction func calculateTapped (sender : AnyObject)  {
     tipCalc.total = Double((totalTextField.text! as NSString).doubleValue)
     possibleTips = tipCalc.returnPossibleTips()
     sortedtipValue = Array(possibleTips.keys).sort()
     tableView.reloadData()
        
    }

    @IBAction func taxPercentageChanged (sender : AnyObject) {
        tipCalc.taxPct = Double(taxPctSlider.value) / 100.0
        refreshUI()
            
    }
        
    @IBAction func viewTapped (sender : AnyObject) {
        totalTextField.resignFirstResponder()
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedtipValue.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let block = UITableViewCell(style: UITableViewCellStyle.Value2, reuseIdentifier: nil)
        
        let tipPct = sortedtipValue[indexPath.row]
        let tipAmt = possibleTips[tipPct]!.tipAmt
        let total = possibleTips[tipPct]!.total
        
        block.textLabel?.text = "\(tipPct)%:"
        block.detailTextLabel?.text = String(format:"Tip: $%0.2f, Total Amount: $%0.2f", tipAmt, total)
        return block
  }

}