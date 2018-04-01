//
//  MainModels.swift
//  RXSwiftLogIn
//
//  Created by Damian Markowski on 01.04.2018.
//  Copyright (c) 2018 Damian Markowski. All rights reserved.

import UIKit
import RxSwift

struct LogInData {
    
    var email = Variable<String>("")
    var password = Variable<String>("")
    
    var isValid: Observable<Bool> {
        return Observable.combineLatest(email.asObservable(), password.asObservable()) { email, password in
            email.count > 0 && password.count > 0
        }
    }
}
