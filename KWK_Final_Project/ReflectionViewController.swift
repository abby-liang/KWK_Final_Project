//
//  ReflectionViewController.swift
//  KWK_Final_Project
//
//  Created by abby on 7/14/20.
//  Copyright © 2020 Sophia Wu. All rights reserved.
//

import UIKit

class ReflectionViewController: UIViewController {
    
    var previousVC = LogTableViewController()
    var selectedReflection : LogCD?

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var reflectionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var hoursLabel: UILabel!
    
    @IBAction func completeTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                   if let theReflection = selectedReflection
                   {
                       context.delete(theReflection)
                       
                       navigationController?.popViewController(animated: true)
                   }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = selectedReflection?.name
        reflectionLabel.text = selectedReflection?.reflection
        dateLabel.text = selectedReflection?.date
        hoursLabel.text = selectedReflection?.hours
        
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
