//
//  AuthenticationViewModel.swift
//  MyInstagram
//
//  Created by Sidany Walker on 2/25/22.
//

import UIKit

struct LoginViewModel {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    
    }
    
    var buttonBackgroundColor: UIColor {
        return formIsValid ? .systemPurple : .lightGray.withAlphaComponent(0.5)
        // ternary statement which shortens 'if else' code
    }
    
    var buttonTitleColor: UIColor {
        return formIsValid ? .white : UIColor(white: 1, alpha: 0.67)
    }
}
    
struct RegistrationViewModel {
        
    }

