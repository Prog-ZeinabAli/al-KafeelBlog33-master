//
//  menuViewController.swift
//  navigation
//
//  Created by test1 on 2/18/20.
//  Copyright © 2020 test1. All rights reserved.
//

import UIKit

class menuViewController: UITableViewController {

    enum MenuType: intmax_t{
        case home
        case blogs
        case blogers
        case categories
        case log_in
        case sign_up
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else {return}
        dismiss(animated: true){
            print("dismissing: \(menuType)")
        }
        
       
    }
    
}
