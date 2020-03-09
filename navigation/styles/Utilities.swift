//
//  Utilities.swift
//  FirebaseLogIn
//
//  Created by test1 on 1/2/20.
//  Copyright © 2020 test1. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    
    //styling textFields
    static func styleTextField(_ textfield:UITextField){
        
        
        //create the bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height-2, width: textfield.frame.width ,height: 2)
        
        bottomLine.backgroundColor = UIColor.init(red: 48/255, green:173/255 , blue: 99/255 ,alpha: 1).cgColor
        
        
        //remove textfields borders
        textfield.borderStyle = .none
        
        //add line to the text field
        textfield.layer.addSublayer(bottomLine)
        
    }
    
  //styling hollow buttons
    static func styleHollowButton(_ button: UIButton){
        //holow rounded corners
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.black
    }
    
    
    //styling filled buttons
    static func styleFilledButton(_ button: UIButton){
        //filling rounded corners
        button.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    
    static func isPasswordValid(_ password : String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@","^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password )
    }

}
