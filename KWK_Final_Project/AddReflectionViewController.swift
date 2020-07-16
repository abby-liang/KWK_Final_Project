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
    @IBOutlet weak var reflectionTextField: UITextField!
    @IBOutlet weak var hoursField: UITextField!
    
    
    @IBOutlet weak var dateTxt: UITextField!
    let datePicker = UIDatePicker()
    
    func createDatePicker() {
        dateTxt.textAlignment = .center
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //bar button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        
        //assign toolbar
        dateTxt.inputAccessoryView = toolbar
        
        //datepicker to text field
        dateTxt.inputView = datePicker
        
        //datepicker mode
        datePicker.datePickerMode = .date
        
    }
    
    @objc func donePressed() {
        //formatter
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        dateTxt.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @IBAction func addTapped(_ sender: Any) {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

            let newReflection = LogCD(entity: LogCD.entity(), insertInto: context)
            
            if let reflectionTitle = titleTextField.text, let reflectionText = reflectionTextField.text, let dateText = dateTxt.text, let hoursText = hoursField.text {
              newReflection.name = reflectionTitle
                newReflection.reflection = reflectionText
                newReflection.date = dateText
                newReflection.hours = hoursText
          }

          try? context.save()
          navigationController?.popViewController(animated: true)
        
    }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
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
