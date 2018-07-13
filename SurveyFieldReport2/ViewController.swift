//
//  ViewController.swift
//  SurveyFieldReport2
//
//  Created by Trenton Hamilton on 8/24/17.
//  Copyright © 2017 Trenton Hamilton. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, UITextFieldDelegate, MFMailComposeViewControllerDelegate {
    
    
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
    
    @IBAction func SubmitEmail(_ sender: Any) {
        let SubjectText = "Aztec Survey Field Report"
        
        
        //var MessageBody = "test"
        var MessageBody = "lot = " + LotI.text! + "\n Block = " +
            BlockI.text! + "\n Builder = " + BuilderI.text! +
            "\n Subdivision = " + SubdivisionI.text! + "\n Filing = " +
            FilingI.text! + "\n Address " + AddressI.text! + "\n comments = " +
            CommentsI.text!
        
        if(HSSPPP.isOn)
        {
        MessageBody += "\n House Staked per plot plan"
        }
        if (HSUTSLNC.isOn)
        {
            MessageBody += "\n House Stake, unable to stake , lot not Clear"
        }
        if (HSOSC.isOn)
        {
            MessageBody += "\n House Stake, other, see comments "
        }
        if (FFCPPPP.isOn)
        {
            MessageBody += "\n Foundation Form Check, passed per plot plan"
        }
        if (FFCFSC.isOn)
        {
            MessageBody += "\n Foundation Form Check, faild, see comments"
        }
        if (FFCOSC.isOn)
        {
            MessageBody += "\n Foundation Form Check, other, see comments "
        }
        if (RGSSPPP.isOn)
        {
            MessageBody += "\n Rough Grade Stakes, set per plot plan"
        }
        if (RGSOSC.isOn)
        {
            MessageBody += "\n Rough Grade Stakes, other, see comments"
        }
        if (ISSSFR.isOn)
        {
            MessageBody += "\n Improvement Survey, see sketch for revisions"
        }
        if (ISFNC.isOn)
        {
            MessageBody += "\n Improvement Survey, flatwork not compleated"
        }
        if (ISOSC.isOn)
        {
            MessageBody += "\n Imorovement Survey, other see comments"
        }
        if (GSPSSFG.isOn)
        {
            MessageBody += "\n Grading Survey, passed, see sketch for grades"
        }
        if (GSFGF.isOn)
        {
            MessageBody += "\n Grading Survey, faild, grading/flatwork"
        }
        if (GSFDNMC.isOn)
        {
            MessageBody += "\n  Grading Survey, faild, does not meet criteria"
        }
        if (GSOSC.isOn)
        {
            MessageBody += "\n  Grading Survey, other, see Comments"
        }
        
        
        
        let mc: MFMailComposeViewController = MFMailComposeViewController()
        mc.mailComposeDelegate = self
        mc.setSubject(SubjectText)
        mc.setMessageBody(MessageBody, isHTML: false)
        mc.setToRecipients([EmailI.text!])
        
        self.present(mc, animated: true, completion: nil)
        
        //UIApplication.shared.open(URL(string:("mailto:" + EmailI.text!))! as URL, options: [:], completionHandler: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
   self.dismiss(animated: true, completion: nil)
        
    }
    
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
        
        self.BuilderI.delegate = self
        self.EmailI.delegate = self
        self.SubdivisionI.delegate = self
        self.LotI.delegate = self
        self.BlockI.delegate = self
        self.FilingI.delegate = self
        self.AddressI.delegate = self
        

    }
    

   override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Dispose of any resources that can be recreated.
    }
    //hide the keyboard when user touches outside keyboard 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //presses return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        BuilderI.resignFirstResponder()
        EmailI.resignFirstResponder()
        SubdivisionI.resignFirstResponder()
        LotI.resignFirstResponder()
        BlockI.resignFirstResponder()
        FilingI.resignFirstResponder()
        AddressI.resignFirstResponder()
        
        return (true)
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) ->Bool {
        if text == "\n"{
            CommentsI.resignFirstResponder()
            return false
        }
        return true
        
    }
    

}

