//
//  ViewController.swift
//  MyToeDo
//
//  Created by Tripathy, Samiksha (Contractor) on 28/03/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

// to perform segue by entering name which will show in the next screen
    @IBAction func goClick(_ sender: UIButton) {
        let name = nameTF.text ?? ""
        let vc = storyboard?.instantiateViewController(withIdentifier: "firstvc") as! FirstVC
        
        vc.username = name
        
        show(vc, sender: self)
       
    }
    
    
}

