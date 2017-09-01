//
//  ViewController.swift
//  SurveyFieldReport2
//
//  Created by Trenton Hamilton on 8/24/17.
//  Copyright © 2017 Trenton Hamilton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var SubmitB: UIButton!
    @IBOutlet weak var DateB: UIDatePicker!
    @IBOutlet weak var ResetB: UIButton!
    @IBOutlet weak var LotI: UITextField!
    @IBOutlet weak var BlockI: UITextField!
    @IBOutlet weak var EmailI: UITextField!
    @IBOutlet weak var BuilderI: UITextField!
    @IBOutlet weak var SubdivisionI: UITextField!
    @IBOutlet weak var FilingI: UITextField!
    @IBOutlet weak var AddressI: UITextField!
    @IBOutlet weak var HSSPPP: UISwitch!
    @IBOutlet weak var HSUTSLNC: UISwitch!
    @IBOutlet weak var HSOSC: UISwitch!
    @IBOutlet weak var FFCPPPP: UISwitch!
    @IBOutlet weak var FFCFSC: UISwitch!
    @IBOutlet weak var FFCOSC: UISwitch!
    @IBOutlet weak var RGSSPPP: UISwitch!
    @IBOutlet weak var RGSOSC: UISwitch!
    @IBOutlet weak var ISSSFR: UISwitch!
    @IBOutlet weak var ISFNC: UISwitch!
    @IBOutlet weak var ISOSC: UISwitch!
    @IBOutlet weak var GSPSSFG: UISwitch!
    @IBOutlet weak var GSFGF: UISwitch!
    @IBOutlet weak var GSFDNMC: UISwitch!
    @IBOutlet weak var GSOSC: UISwitch!
    @IBOutlet weak var CommentsI: UITextView!
    
    
    @IBAction func ResetBA(_ sender: Any) {
        LotI.text = ""
        BlockI.text = ""
        BuilderI.text = ""
        EmailI.text = ""
        SubdivisionI.text = ""
        FilingI.text = ""
        AddressI.text = ""
        HSSPPP.setOn(false, animated: true)
        HSUTSLNC.setOn(false, animated: true)
        HSOSC.setOn(false, animated: true)
        FFCFSC.setOn(false, animated: true)
        FFCOSC.setOn(false, animated: true)
        FFCPPPP.setOn(false, animated: true)
        RGSOSC.setOn(false, animated: true)
        RGSSPPP.setOn(false, animated: true)
        ISFNC.setOn(false, animated: true)
        ISOSC.setOn(false, animated: true)
        ISSSFR.setOn(false, animated: true)
        GSFGF.setOn(false, animated: true)
        GSOSC.setOn(false, animated: true)
        GSFDNMC.setOn(false, animated: true)
        GSPSSFG.setOn(false, animated: true)
        CommentsI.text = ""
        //still need to reset the date to doday
        DateB.setDate(NSDate() as Date, animated: false)
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

