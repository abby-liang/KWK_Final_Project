//
//  ToDoTableViewController.swift
//  toDoList
//
//  Created by abby on 7/13/20.
//  Copyright © 2020 abby. All rights reserved.
//
import UIKit

class LogTableViewController: UITableViewController {
    
    override func viewDidLoad() {
      super.viewDidLoad()
        //getReflections()
        
    }

    var reflections : [LogCD] = []
    
    func getReflections() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let coreDataReflections = try?context.fetch(LogCD.fetchRequest()) as? [LogCD] {
                
                reflections = coreDataReflections
                tableView.reloadData()
                
            }
            
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reflections.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let toDo = reflections[indexPath.row]
        cell.textLabel?.text = toDo.name

        return cell
    }

    override func viewWillAppear(_ animated: Bool) {
        getReflections()
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

  // this gives us a single ToDo
        let reflection = reflections[indexPath.row]

        performSegue(withIdentifier: "moveToComplete", sender: reflection)
    }
 
 

/*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
    }
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddReflectionViewController {
            addVC.previousVC = self
        }
        
        if let completeVC = segue.destination as? ReflectionViewController{
            if let toDo = sender as? LogCD {
                completeVC.selectedReflection = toDo
                completeVC.previousVC = self
            }
        }
        
    }


}
