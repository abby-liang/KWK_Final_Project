//
//  ProfileViewController.swift
//  KWK_Final_Project
//
//  Created by Kimberly Sejas on 7/14/20.
//  Copyright © 2020 Sophia Wu. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    var nameText = ""

    @IBOutlet weak var goal: UITextField!
    var goalText = ""
    
    @IBAction func done(_ sender: Any) {
        self.nameText = textField.text!
        self.goalText = goal.text!
        performSegue(withIdentifier: "transfer", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewController
        vc.finalName = self.nameText
        vc.finalGoal = self.goalText
    }
    
    @IBOutlet weak var name: UITextField!
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

}
