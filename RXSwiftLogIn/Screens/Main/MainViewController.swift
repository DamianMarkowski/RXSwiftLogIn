//
//  MainViewController.swift
//  RXSwiftLogIn
//
//  Created by Damian Markowski on 01.04.2018.
//  Copyright (c) 2018 Damian Markowski. All rights reserved.

import UIKit

protocol MainDisplayLogic: class {
  
}

class MainViewController: UIViewController, MainDisplayLogic {
  
    var interactor: MainBusinessLogic?
    var router: (NSObjectProtocol & MainRoutingLogic)?

    // MARK: Setup
  
    private func setup() {
        let viewController = self
        let interactor = MainInteractor()
        let presenter = MainPresenter()
        let router = MainRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
    }
  
    // MARK: View lifecycle
  
    override func loadView() {
        super.loadView()
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
