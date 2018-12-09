//
//  AppDelegate.swift
//  WhatLoversDo
//
//  Created by killi8n on 09/12/2018.
//  Copyright © 2018 aaaalpooo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Then
import SnapKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        
        let coreViewReactor = CoreViewReactor()
        let coreViewController = CoreViewController(reactor: coreViewReactor)
        
        window?.rootViewController = coreViewController
        window?.makeKeyAndVisible()
        
        return true
    }



}

