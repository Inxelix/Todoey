//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Артем Загоскин on 31/03/2019.
//  Copyright © 2019 Tyoma Zagoskin. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: SwipeTableViewController {
    
    let realm = try! Realm()

    var categories: Results<Category>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        loadCategories()
        
    }

    
    @IBAction func addButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Add new category", message: "", preferredStyle: .alert)
        
        var textField = UITextField()
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
            let newCategory = Category()
            newCategory.name = textField.text!
            
            if newCategory.name != "" {
                self.save(newCategory)
            }
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new category"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ToDoListViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = super.tableView(tableView, cellForRowAt: indexPath)

        cell.textLabel?.text = categories?[indexPath.row].name ?? "Now categories added yet"
        
        return cell
    
    }
    
    override func updateModel(at indexPath: IndexPath) {
        if let categoryForDeletion = self.categories?[indexPath.row] {
            do {
                try self.realm.write {
                    self.realm.delete(categoryForDeletion)
                }
            } catch {
                print("Can't delete 'cause: \(error)")
            }
        }
    }
    
    func save(_ category: Category) {
        
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Fuckin' error")
        }
        
        self.tableView.reloadData()
        
    }
    
    func loadCategories() {
        categories = realm.objects(Category.self)
        
        tableView.reloadData()
    }
    
}
