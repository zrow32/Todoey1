//
//  ViewController.swift
//  Todoey
//
//  Created by Vladimir Zhirov on 4/14/19.
//  Copyright © 2019 Vladimir Zhirov. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var itemArray = ["Wake up","Drink","Exercise"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        //print (itemArray[indexPath.row])
        
        if  tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    @IBAction func addItemPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new ToDo Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add new Item", style: .default) { (action) in
            
            // what will happen when user clicks add button
     
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextfield) in
            alertTextfield.placeholder = "Create new Item"
            textField = alertTextfield
        }
        
        alert.addAction(action)
      present(alert, animated: true, completion: nil)
        
    }
}

