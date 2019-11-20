//
//  ViewController.swift
//  lab13
//
//  Created by yenifer santiago  on 11/14/19.
//  Copyright © 2019 yenifer santiago . All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIBarButtonItem!
    @IBOutlet weak var logOut: UIBarButtonItem!
    @IBOutlet weak var loginInfoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil{
            self.loginButton.isEnabled = false
            self.logOut.isEnabled = true
            self.loginInfoLabel.text = "hello" +  (Auth.auth().currentUser?.email)!
        }else{
            self.loginButton.isEnabled = true
            self.logOut.isEnabled = false
            self.loginInfoLabel.text = "hello please login"
        }
        
    }
    
    @IBAction func logOuthButtonCliked(_ sender: Any) {
        
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                
                self.loginButton.isEnabled = true
                self.logOut.isEnabled = false
                self.loginInfoLabel.text = "hello please login"
                
            } catch let signOutError as NSError {
                print("error signing outh :  %@", signOutError)
                
            }
        }
    }
    
    
}

