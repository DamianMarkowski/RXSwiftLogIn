//
//  MainRouter.swift
//  RXSwiftLogIn
//
//  Created by Damian Markowski on 01.04.2018.
//  Copyright (c) 2018 Damian Markowski. All rights reserved.

import UIKit

@objc protocol MainRoutingLogic {
  
}

class MainRouter: NSObject, MainRoutingLogic {
    
    weak var viewController: MainViewController?
}
