//
//  CategoryViewController.swift
//  ToDoList
//
//  Created by Chloe Fermanis on 14/5/20.
//  Copyright © 2020 Chloe Fermanis. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UITableViewController {
    
    let realm = try! Realm()
    
    var category = [Category]()
        
//    var selectedCategory : Category? {
//           didSet {
//            //  loadItems()
//           }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: - Category Data Source Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.count
       }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCategoryCell", for: indexPath)
        cell.textLabel?.text = category[indexPath.row].name
        return cell
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var alertTextField = UITextField()
        
        let alert = UIAlertController(title: "Add Category", message: "", preferredStyle: .alert)
        
        
        let actionAdd = UIAlertAction(title: "Add", style: .default) { (actionAdd) in
            
            let newCategory = Category()
            newCategory.name = alertTextField.text!
            
            self.category.append(newCategory)
            self.saveCategory(category: newCategory)
        }
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel) { (actionCancel) in
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Create New Category"
            alertTextField = textField
        }
        alert.addAction(actionCancel)
        alert.addAction(actionAdd)
        
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "CategoryToItem", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let desinationVC = segue.destination as! ToDoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            desinationVC.selectedCategory = category[indexPath.row]
            
            
        }
    }
    
    //MARK: - TableView Manipulation Methods / REALM


    func saveCategory(category: Category) {
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error")
        }
        tableView.reloadData()
    }
    
    func loadCategory() {
    }
    
    
}
