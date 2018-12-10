//
//  RegisterViewController.swift
//  WhatLoversDo
//
//  Created by killi8n on 09/12/2018.
//  Copyright © 2018 aaaalpooo. All rights reserved.
//

import ReactorKit
import RxSwift
import RxCocoa

class RegisterViewController: BaseViewController, View {
    
    
    typealias Reactor = RegisterViewReactor
    
    init(reactor: Reactor) {
        super.init()
        self.reactor = reactor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let dismissButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: nil)
    
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
        self.title = "REGISTER"
        self.navigationItem.rightBarButtonItem = self.dismissButton
        
    }
    
    override func setupConstraints() {
        
    }
    
    func bind(reactor: RegisterViewReactor) {
        self.dismissButton.rx.tap
            .map { Reactor.Action.setDismiss(isDismissed: true) }
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        reactor.state.asObservable().map { $0.isDismissed }
            .distinctUntilChanged()
            .filter { $0 }
            .subscribe(onNext: { [weak self] _ in
                self?.dismiss(animated: true, completion: nil)
            })
            .disposed(by: self.disposeBag)
    }


}
