//
//  ViewController.swift
//  Todoey
//
//  Created by Vladimir Zhirov on 4/14/19.
//  Copyright © 2019 Vladimir Zhirov. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard      // UserDefaults version for a blind coder

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//
//        if let items  = defaults.array(forKey: "ToDoListArray") as? [String] {
//            itemArray = items
            //                     UserDefaults
            
            let newItem = Item()
            newItem.title = "Wake up"
            itemArray.append(newItem)
        
            let newItem2 = Item()
            newItem2.title = "Wash"
            itemArray.append(newItem2)
        
            let newItem3 = Item()
            newItem3.title = "Exercise"
            itemArray.append(newItem3)
        }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        
//        if itemArray[indexPath.row].done == true {
//            cell.accessoryType = .checkmark
//            }  else {
//            cell.accessoryType = .none
//            }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    @IBAction func addItemPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new ToDo Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add new Item", style: .default) { (action) in
            
            // what will happen when user clicks add button
            
            let newItem = Item()
            newItem.title = textField.text!
            
     
            self.itemArray.append(newItem)
            
    //        self.defaults.set(self.itemArray, forKey: "ToDoListArray") // UserDefaults version
            // leave this line commented  or the app will constantly crash trying to save data w/o any method offered
            
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

