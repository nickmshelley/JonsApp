//
//  ViewController.swift
//  JonsApp
//
//  Created by Heather Shelley on 10/14/14.
//  Copyright (c) 2014 Mine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var clientNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var requestTextField: UITextField!
    
    let baseURLString = "https://admin4.testandtarget.omniture.com/admin/rest/v4/segments?"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set defaults here
        // You can also delete or comment these lines if you want it to start blank
        clientNameTextField.text = "jonteherophotography"
        emailTextField.text = "nickmshelly@gmail.com"
        passwordTextField.text = "seeyoul8r"
    }

    @IBAction func submit() {
        //resignFirstResponder()
        let urlString = "\(baseURLString)client=\(clientNameTextField.text)&email=\(emailTextField.text)&password=\(passwordTextField.text)"
        requestTextField.text = urlString
        if let url = NSURL(string: urlString) {
            if let data = NSData(contentsOfURL: url) {
                if let response = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as? NSArray {
                    if let formattedData = NSJSONSerialization.dataWithJSONObject(response, options: NSJSONWritingOptions.PrettyPrinted, error: nil) {
                        let resultString = NSString(data: formattedData, encoding: NSUTF8StringEncoding)
                        performSegueWithIdentifier("ResultsSegue", sender: resultString)
                    }
                }
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let controller = segue.destinationViewController as? ResultsViewController {
            controller.resultsString = sender as String
        }
    }
}

