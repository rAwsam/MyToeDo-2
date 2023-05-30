//
//  ToDoUtility.swift
//  MyToeDo
//
//  Created by Tripathy, Samiksha (Contractor) on 16/05/23.
//

import Foundation
import UIKit

struct ToDoUtility{
    static var instance = ToDoUtility()
    
    let dbCntxt = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private init(){
        
    }
    
    func addTask(task: String ,desc: String,date: Date,type: String,priority: String){
        
        let toDo = MyToeDo(context: dbCntxt)
        toDo.date = date
        toDo.heading = task
        toDo.detl = desc
        toDo.type = type
        toDo.prior = priority
        
        do{
            try dbCntxt.save()
        }catch{
            
        }
    }
    func getalLdata() -> [MyToeDo]{
        let todoList = MyToeDo.fetchRequest()
        do{
            let result = try dbCntxt.fetch(todoList)
            return result
        }catch {
            return []
        }
        
    }
    func deleteTask(toDo: MyToeDo){
        dbCntxt.delete(toDo)
        do{
            try dbCntxt.save()
        }catch{
            
        }
    }
}

