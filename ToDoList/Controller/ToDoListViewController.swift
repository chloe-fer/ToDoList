//
//  ViewController.swift
//  ToDoList
//
//  Created by Chloe Fermanis on 13/5/20.
//  Copyright © 2020 Chloe Fermanis. All rights reserved.
//

import UIKit
import RealmSwift

class ToDoListViewController: UITableViewController {

    var item = [Item]()
    
    var selectedCategory : Category? {
           didSet {
           //   loadItems()
           }
       }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - TableView Data Source Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = item[indexPath.row].title
          return cell
    }
    
    //MARK: - TableView Delegate Methods

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 
        //tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
 
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    
    //MARK: - Add New Items

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var alertTextField = UITextField()
        
        let alert = UIAlertController(title: "Add Item", message: "", preferredStyle: .alert)
        
        let actionAdd = UIAlertAction(title: "Add Item", style: .default) { (actionAdd) in

            let newItem = Item()
            newItem.title = alertTextField.text!
            
            self.item.append(newItem)
            //self.saveItem(item: newItem)

            self.tableView.reloadData()
        }
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .default) { (actionCancel) in
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Create New Item"
            alertTextField = textField
        }
        
        alert.addAction(actionCancel)
        alert.addAction(actionAdd)
        
        present(alert, animated: true, completion: nil)
            

    }
    
//    func loadItems() {
//        tableView.reloadData()
//    }
//
//    func saveItem(item: Item) {
//        do {
//            try realm.write {
//                realm.add(item)
//            }
//        } catch {
//            print("Error")
//        }
//        tableView.reloadData()
//    }
    
    
}

