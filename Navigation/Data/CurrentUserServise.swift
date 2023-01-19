//
//  CurrentUserServise.swift
//  Navigation
//
//  Created by Илья Сидорик on 19.01.2023.
//

import Foundation
import UIKit


class CurrentUserServise: UserServise {
//    static let shared: CurrentUserServise = .init(user: <#User#>)
    
    let user: User
    
    func checkLogin(login: String) -> User? {
        if login  == self.user.login {
            return user
        }
        
        return nil
    }
    
    init(user: User) {
        self.user = user
    }
    
}