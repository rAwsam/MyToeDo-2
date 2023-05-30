//
//  FirstVC.swift
//  MyToeDo
//
//  Created by Tripathy, Samiksha (Contractor) on 06/04/23.
//

import UIKit

class FirstVC: UIViewController {

    @IBOutlet weak var ContinueB: UIButton!
    
    @IBOutlet weak var nameL1: UILabel!
    
    var username : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameL1.text = "Hello \(username) !!!"
//        setUpButton()
    }
    
//    func setUpButton(){
//        let guestAction = UIAction(title: "Guest") { _ in
//            print("Guest is selected. ")
//        }
//        let NewAction = UIAction(title: "New User") { _ in
//            print("New user is selected. ")
//        }
//        let UseriAction = UIAction(title: "User") { _ in
//            print("User is selected. ")
//        }
//
//        let userTypeMenu = UIMenu(title: "Continue As...", children: [guestAction, NewAction, UseriAction ])
//
//        ContinueB.menu = userTypeMenu
//        }
        
    }



