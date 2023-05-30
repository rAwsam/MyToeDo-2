//
//  AddRemVC.swift
//  MyToeDo
//
//  Created by Tripathy, Samiksha (Contractor) on 07/04/23.
//

import UIKit

class AddRemVC: UIViewController, UITextViewDelegate {
    
      var isAuthorised = false
      var DOR = ""
      var DOT = ""


    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var descTV: UITextView!
    
    @IBOutlet weak var alarmL: UILabel!
    
    @IBOutlet weak var datepicker: UIDatePicker!
    
    @IBOutlet weak var priorityS: UISegmentedControl!
    
    @IBOutlet weak var typeSC: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action:#selector(didTapSaveB))
        checkNotificationPermission()
        UNUserNotificationCenter.current().delegate = self
        nameTF.layer.cornerRadius = 10
        descTV.layer.cornerRadius = 10

    }
    
    

    @objc
    func didTapSaveB () {
        
        let title = nameTF.text ?? ""
        let desc = descTV.text ?? ""
        let date = datepicker.date
        let typeIndex = typeSC.selectedSegmentIndex
        let type = typeSC.titleForSegment(at: typeIndex)
        let priorityIndex = priorityS.selectedSegmentIndex
        let priority = priorityS.titleForSegment(at: priorityIndex)
        
        ToDoUtility.instance.addTask(task: title, desc: desc, date: date, type: type ?? "", priority: priority ?? "")
        scheduleNotification(title: title, desc: desc, date: date, priority: priority ?? "")
        
        let alertVC = UIAlertController(title: "Save ToDo", message: "", preferredStyle: .alert)
        let DeleteAction = UIAlertAction(title: "delete", style: .destructive)
        
        let saveAction = UIAlertAction(title: "save", style: .cancel) { _ in
            self.navigationController?.popViewController(animated: true)
        }
        alertVC.addAction(saveAction)
        alertVC.addAction(DeleteAction)
        self.present(alertVC,animated: true)
        }

    
    func checkNotificationPermission(){
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            switch settings.authorizationStatus{
            case .notDetermined:
                UNUserNotificationCenter.current().requestAuthorization(options: [.sound,.alert,.badge]){ success, _ in
                    if success {
                        self.isAuthorised = true
                    }
                    else {
                        self.isAuthorised = false
                    }
                
                }
            case .denied:
                self.isAuthorised = false
            case .authorized:
                self .isAuthorised = true
            default:
                break
            }
        }
        
    }


    @IBAction func alarmSwitch(_ sender: UISwitch) {
        if sender.isOn{
                print("Alarm is set")
                alarmL.text = "Alarm ON"
                
            }
        else{
            print("Alarm is off")
            alarmL.text = "Set Alarm"
            
        }
        }
    

    }


extension AddRemVC : UNUserNotificationCenterDelegate {

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
    }
}
