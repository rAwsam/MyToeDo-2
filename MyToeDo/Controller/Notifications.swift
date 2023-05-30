//
//  Notifications.swift
//  MyToeDo
//
//  Created by Tripathy, Samiksha (Contractor) on 16/05/23.
//

import Foundation
import UIKit
import UserNotifications

extension UIViewController {
    func scheduleNotification(title : String,desc : String,date : Date,priority: String){
        //create notification content
        let contnt = UNMutableNotificationContent()
        contnt.title = title
        contnt.sound = .default
        contnt.body = desc
        
        //create trigger
        let targetdate = Calendar.current.dateComponents([.day,.month,.year,.minute,.hour], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: targetdate, repeats: false)
        
        //register request
        
        let request = UNNotificationRequest(identifier: "MyToeDo", content: contnt, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    
}
