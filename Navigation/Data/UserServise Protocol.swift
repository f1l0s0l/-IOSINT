//
//  UserServise Protocol.swift
//  Navigation
//
//  Created by Илья Сидорик on 19.01.2023.
//

import Foundation


protocol UserServise {
    func checkLogin(login: String) -> User?
}
