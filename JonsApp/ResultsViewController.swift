//
//  ResultsViewController.swift
//  JonsApp
//
//  Created by Heather Shelley on 11/25/14.
//  Copyright (c) 2014 Mine. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    var resultsString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = resultsString
    }
}
