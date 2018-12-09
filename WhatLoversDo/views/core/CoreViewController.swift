//
//  MainViewController.swift
//  WhatLoversDo
//
//  Created by killi8n on 09/12/2018.
//  Copyright © 2018 aaaalpooo. All rights reserved.
//

import UIKit
import ReactorKit

class CoreViewController: BaseViewController, View {
    
    let activitiyIndicatorView: UIActivityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    
    typealias Reactor = CoreViewReactor
    
    init(reactor: Reactor) {
        super.init()
        self.reactor = reactor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.view.addSubview(self.activitiyIndicatorView)
        
    }
    
    override func setupConstraints() {
        self.activitiyIndicatorView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    func bind(reactor: CoreViewReactor) {
        reactor.state
            .map { $0.isChecking }
            .bind(to: self.activitiyIndicatorView.rx.isAnimating)
            .disposed(by: self.disposeBag)
    }


}
