//
//  MainViewController.swift
//  RXSwiftLogIn
//
//  Created by Damian Markowski on 01.04.2018.
//  Copyright (c) 2018 Damian Markowski. All rights reserved.

import UIKit
import SnapKit

protocol MainDisplayLogic: class {
  
}

class MainViewController: UIViewController, MainDisplayLogic {
    
    // Clean Swift Architecture layers
    var interactor: MainBusinessLogic?
    var router: (NSObjectProtocol & MainRoutingLogic)?
    // Views
    private var emailTextField: UITextField!
    private var passwordTextField: UITextField!
    private var logInButton: UIButton!
    // Constants
    private let viewsHorizontalMargin = 30
    private let viewsVerticalMargin = 20
    private let emailTextFieldPlaceholder = "E-mail"
    private let passwordTextFieldPlaceholder = "Password"
    private let logInButtonTitle = "Log in"
    
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
        addViews()
    }
    
    // MARK: Private methods
    
    private func addViews(){
        addEmailTextField()
        addPasswordTextField()
        addLogInButton()
    }
    
    private func addEmailTextField(){
        emailTextField = UITextField()
        configureEmailTextField()
        view.addSubview(emailTextField)
        addConstraintsToEmailTextField()
    }
    
    private func configureEmailTextField(){
        emailTextField.placeholder = emailTextFieldPlaceholder
        configureTextFieldCommon(emailTextField)
    }
    
    private func configureTextFieldCommon(_ textField: UITextField){
        textField.autocapitalizationType = .none
        textField.layer.borderWidth = 1
    }
    
    private func addConstraintsToEmailTextField(){
        emailTextField.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(viewsHorizontalMargin)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(viewsVerticalMargin)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-viewsHorizontalMargin)
        }
    }
    
    private func addPasswordTextField(){
        passwordTextField = UITextField()
        configurePasswordTextField()
        view.addSubview(passwordTextField)
        addConstraintsToPasswordTextField()
    }
    
    private func configurePasswordTextField(){
        passwordTextField.placeholder = passwordTextFieldPlaceholder
        passwordTextField.isSecureTextEntry = true
        configureTextFieldCommon(passwordTextField)
    }
    
    private func addConstraintsToPasswordTextField(){
        passwordTextField.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(viewsHorizontalMargin)
            make.top.equalTo(emailTextField.snp.bottom).offset(viewsVerticalMargin)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-viewsHorizontalMargin)
        }
    }
    
    private func addLogInButton(){
        logInButton = UIButton()
        configureLogInButton()
        view.addSubview(logInButton)
        addConstraintsToLogInButton()
    }
    
    private func configureLogInButton(){
        logInButton.setTitle(logInButtonTitle, for: .normal)
        logInButton.setTitleColor(UIColor.black, for: .normal)
        logInButton.backgroundColor = UIColor.green
    }
    
    private func addConstraintsToLogInButton(){
        logInButton.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(viewsHorizontalMargin)
            make.top.equalTo(passwordTextField.snp.bottom).offset(viewsVerticalMargin)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-viewsHorizontalMargin)
        }
    }
}
