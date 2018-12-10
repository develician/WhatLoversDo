//
//  LoginViewController.swift
//  WhatLoversDo
//
//  Created by killi8n on 09/12/2018.
//  Copyright © 2018 aaaalpooo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import ReactorKit

class LoginViewController: BaseViewController, View {

    typealias Reactor = LoginViewReactor
    
    init(reactor: Reactor) {
        super.init()
        self.reactor = reactor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleLabel: UILabel = UILabel().then {
        $0.backgroundColor = .white
        $0.text = "사랑의 관문..."
        $0.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.bold)
    }
    
    let emailInput: UITextField = UITextField().then {
        $0.borderStyle = UITextField.BorderStyle.line
        $0.placeholder = "당신의 이메일.."
        $0.setLeftPaddingPoints(8)
        $0.setRightPaddingPoints(8)
    }
    
    let passwordInput: UITextField = UITextField().then {
        $0.borderStyle = UITextField.BorderStyle.line
        $0.placeholder = "당신의 비밀번호.."
        $0.setLeftPaddingPoints(8)
        $0.setRightPaddingPoints(8)
        $0.isSecureTextEntry = true
    }
    
    let loginButton: UIButton = UIButton(type: UIButton.ButtonType.custom).then {
        $0.setTitle("관문 통과하기", for: UIControl.State.normal)
        $0.setBackgroundColor(color: UIColor.red, forState: UIControl.State.normal)
        $0.setBackgroundColor(color: UIColor.blue, forState: UIControl.State.highlighted)
        $0.tintColor = UIColor.white
        $0.layer.cornerRadius = 3.0
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 15.0, weight: UIFont.Weight.bold)
    }
    
    let registerButton: UIButton = UIButton(type: UIButton.ButtonType.custom).then {
        $0.setTitle("REGISTER", for: UIControl.State.normal)
        $0.setBackgroundColor(color: UIColor.red, forState: UIControl.State.normal)
        $0.setBackgroundColor(color: UIColor.blue, forState: UIControl.State.highlighted)
        $0.tintColor = UIColor.white
        $0.layer.cornerRadius = 3.0
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 15.0, weight: UIFont.Weight.bold)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "What Lovers Do"
        
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.emailInput)
        self.view.addSubview(self.passwordInput)
        self.view.addSubview(self.loginButton)
        self.view.addSubview(self.registerButton)
        
    }
    
    override func setupConstraints() {
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.topLayoutGuide.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(50)
        }
        
        self.emailInput.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(16)
            make.left.equalTo(self.titleLabel.snp.left)
            make.right.equalTo(self.titleLabel.snp.right)
            make.height.equalTo(40)
        }
        
        self.passwordInput.snp.makeConstraints { (make) in
            make.top.equalTo(self.emailInput.snp.bottom).offset(16)
            make.left.equalTo(self.titleLabel.snp.left)
            make.right.equalTo(self.titleLabel.snp.right)
            make.height.equalTo(40)
        }
        
        self.loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.passwordInput.snp.bottom).offset(16)
            make.left.equalTo(self.titleLabel.snp.left)
            make.right.equalTo(self.titleLabel.snp.right)
            make.height.equalTo(40)
        }
        
        self.registerButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.loginButton.snp.bottom).offset(16)
            make.left.equalTo(self.titleLabel.snp.left)
            make.right.equalTo(self.titleLabel.snp.right)
            make.height.equalTo(40)
        }
    }
    
    func bind(reactor: LoginViewReactor) {
        self.registerButton.rx.tap.subscribe(onNext: { [weak self] _ in
            let registerViewReactor = RegisterViewReactor()
            let registerViewController = RegisterViewController(reactor: registerViewReactor)
            let navigator = UINavigationController(rootViewController: registerViewController)
            self?.present(navigator, animated: true, completion: nil)
//            self?.navigationController?.pushViewController(registerViewController, animated: true)
        }).disposed(by: self.disposeBag)
    }


}
