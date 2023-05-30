//
//  ReminderVC.swift
//  MyToeDo
//
//  Created by Tripathy, Samiksha (Contractor) on 16/05/23.
//

import UIKit

class ReminderVC: UIViewController {
    
    
    
    @IBOutlet weak var titleL: UILabel!
    
    
    @IBOutlet weak var descriptionL: UILabel!
    
    
    
    @IBOutlet weak var dateL: UILabel!
    
    
    
    @IBOutlet weak var priorityL: UILabel!
    
    
    @IBOutlet weak var todotypeL: UILabel!
     
    var reminderdetails : MyToeDo?

    override func viewDidLoad() {
        super.viewDidLoad()

        titleL.text = "Title :  \(reminderdetails?.heading ?? "")"
        descriptionL.text = "Description: \(reminderdetails?.detl ?? "")"
        dateL.text = "Date: \(reminderdetails?.date?.formatted() ?? "")"
        priorityL.text = "Priority: \(reminderdetails?.prior ?? "")"
        todotypeL.text = "Type: \(reminderdetails?.type ?? "")"    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
