//
//  SignUpViewController.swift
//  navigation
//
//  Created by test1 on 2/21/20.
//  Copyright © 2020 test1. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var SignUp: UIButton!
    @IBOutlet weak var RePasswordText: UITextField!
    @IBOutlet weak var PasswordText: UITextField!
    @IBOutlet weak var NameText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        styles()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func MenuTapped(_ sender: Any) {
        guard let menuViewController = storyboard?.instantiateViewController(identifier: "MenuViewControlller") else {return}
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self as? UIViewControllerTransitioningDelegate
        present(menuViewController,animated: true)
    }
    
    
    
    func styles()
{
    Utilities.styleFilledButton(SignUp)
    Utilities.styleTextField(RePasswordText)
    Utilities.styleTextField(PasswordText)
    Utilities.styleTextField(NameText)
    Utilities.styleTextField(UserName)
    }

}
