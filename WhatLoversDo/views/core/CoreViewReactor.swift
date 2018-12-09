//
//  CoreViewReactor.swift
//  WhatLoversDo
//
//  Created by killi8n on 09/12/2018.
//  Copyright © 2018 aaaalpooo. All rights reserved.
//

import ReactorKit

class CoreViewReactor: Reactor {
    
    init() {
        self.initialState = State(isChecking: true)
    }
    
    enum Action {
        
    }
    
    struct State {
        var isChecking: Bool
    }
    
    enum Mutation {
        
    }
    
    let initialState: State

    
}
