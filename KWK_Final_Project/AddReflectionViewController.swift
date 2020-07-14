//
//  AddReflectionViewController.swift
//  KWK_Final_Project
//
//  Created by abby on 7/14/20.
//  Copyright © 2020 Sophia Wu. All rights reserved.
//

import UIKit

class AddReflectionViewController: UIViewController {

    var previousVC = LogTableViewController()
   
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBAction func addTapped(_ sender: Any) {
//        let newReflection = VolunteerLog()
//
//        if let reflectionTitle = name.text {
//          newReflection.name = reflectionTitle
//          //reflection.important = importantSwitch.isOn
//        }
        
//        previousVC.reflections.append(newReflection)
//        previousVC.tableView.reloadData()
//        previousVC.reflections.append(newReflection)
        
        // we have to grab this view context to be able to work with Core Data
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

          // we are creating a new ToDoCD object here, naming it toDo
            let newReflection = LogCD(entity: LogCD.entity(), insertInto: context)
            
          // if the titleTextField has text, we will call that text titleText
          if let reflectionTitle = titleTextField.text {
              // we will take the titleText and assign that value to toDo.name
              newReflection.name = reflectionTitle
            
          }

          try? context.save()
          navigationController?.popViewController(animated: true)
        
    }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
