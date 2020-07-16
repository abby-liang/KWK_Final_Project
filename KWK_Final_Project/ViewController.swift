//
//  ViewController.swift
//  KWK_Final_Project
//
//  Created by Sophia Wu on 7/13/20.
//  Copyright © 2020 Sophia Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameText: UILabel!
    var finalName = ""
    
    @IBOutlet weak var goalName: UILabel!
    var finalGoal = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameText.text = "👋🏼 Welcome, \(finalName)!"
        goalName.text = "Your volunteer goal is \(finalGoal) hours."
    }


}

