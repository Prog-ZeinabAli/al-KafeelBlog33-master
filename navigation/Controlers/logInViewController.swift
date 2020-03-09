//
//  logInViewController.swift
//  navigation
//
//  Created by test1 on 2/21/20.
//  Copyright © 2020 test1. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore

class logInViewController: UIViewController {
   
 
    @IBOutlet weak var UserNameText: UITextField!
    
    @IBOutlet weak var PasswordText: UITextField!
    
    @IBOutlet weak var LogInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //function to keep the look of the scene
         styles()
        // Do any additional setup after loading the view.
    }
    @IBAction func LogInTapped(_sender: Any) {
        let manager = LoginManager()
          manager.logIn(permissions: [.publicProfile, .email], viewController: self)
          {
              (Result) in switch Result
              {
              case.cancelled:
                  print("user cancelled process")
                  break
              case.failed(let error):
                  print("failed \(error)")
                  break
              case.success(granted: let grant, declined: let dec, token: let token):
                  print("access token \(token)")
                  
                  
                  
          }
          }
    }
    
    func styles()
    {
        Utilities.styleTextField(UserNameText)
        Utilities.styleTextField(PasswordText)
        Utilities.styleFilledButton(LogInButton)
        
    }

}
