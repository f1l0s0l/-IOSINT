//
//  User.swift
//  Navigation
//
//  Created by Илья Сидорик on 19.01.2023.
//

import UIKit

class User {
    
    var login: String
    var fullName: String
    var avatar: UIImage?
    var status: String
    
    init(login: String, fullName: String, avatar: UIImage?, status: String) {
        self.login = login
        self.fullName = fullName
        self.avatar = avatar
        self.status = status
    }
    
}
