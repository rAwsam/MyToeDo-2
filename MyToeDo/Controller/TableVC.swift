//
//  TableVC.swift
//  MyToeDo
//
//  Created by Tripathy, Samiksha (Contractor) on 16/05/23.
//

import UIKit

class TableVC: UIViewController {
    
    
    var todoList : [MyToeDo] = []

    @IBOutlet weak var tableTV: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableTV.delegate = self
        tableTV.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated:  Bool) {
        todoList = ToDoUtility.instance.getalLdata()
        tableTV.reloadData()
    }
    
    
    @IBAction func didtapaddB(_ sender: UIBarButtonItem) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "add")
        show(vc!, sender: self)
    }
    

    /*
    // MARK: - Navigation

    */

}
extension TableVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ToDoCell
        
        let todo = todoList[indexPath.row]
        cell.taskNmL.text = todo.heading
        cell.dateL.text = todo.date?.formatted()
        print(todo)
        return cell
        
    }
}

extension TableVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = storyboard?.instantiateViewController(withIdentifier: "reminderdetails") as? ReminderVC
        let passData = self.todoList[indexPath.row]
        vc?.reminderdetails = passData
        show(vc!, sender: self)
        
        
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let updateDetails = self.todoList[indexPath.row]
        let edit = UIContextualAction(style: .normal, title: "edit") { _, _, _ in
            
            let alertVC = UIAlertController(title: "Update ToDo", message: "", preferredStyle: .alert)
            alertVC.addTextField(){
                field in
                field.placeholder = "Enter title"
                field.keyboardType = .default
                
            }
            let SaveAction = UIAlertAction(title: "save", style: .default){(action) in
                let textfield = alertVC.textFields![0]  // TF are conidered as arrays so for multiple textfields array index is used to identify the textfield
                //editing title proprty
                if textfield.text?.count != 0{
                    updateDetails.heading = textfield.text
                    self.tableTV.reloadData()
                }
                
            }
            
            let CancelAction = UIAlertAction(title: "cancel", style: .destructive)
            alertVC.addAction(CancelAction)
            alertVC.addAction(SaveAction)
            
            self.present(alertVC,animated: true)
            
        }
        edit.backgroundColor = .systemMint
        
        let delete = UIContextualAction(style: .destructive, title: "delete") { _, _, _ in
            let todolistdelete = self.todoList[indexPath.row]
            ToDoUtility.instance.deleteTask(toDo: todolistdelete)
            self.todoList.remove(at: indexPath.row)
            self.tableTV.reloadData()
            }
        let swipeConfig = UISwipeActionsConfiguration(actions: [delete,edit])
        return swipeConfig
    }
    
}

protocol tableValue {
    func one()
    func two()
}
