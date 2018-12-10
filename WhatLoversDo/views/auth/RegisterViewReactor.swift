//
//  RegisterViewReactor.swift
//  WhatLoversDo
//
//  Created by killi8n on 10/12/2018.
//  Copyright © 2018 aaaalpooo. All rights reserved.
//

import ReactorKit
import RxSwift
import RxCocoa

class RegisterViewReactor: Reactor {
    
    init() {
        self.initialState = State(isDismissed: false)
    }
    
    enum Action {
        case setDismiss(isDismissed: Bool)
    }
    
    struct State {
        var isDismissed: Bool
    }
    
    enum Mutation {
        case setDismiss(isDismissed: Bool)
    }
    
    var initialState: State
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case let .setDismiss(isDismissed):
            return Observable.just(Mutation.setDismiss(isDismissed: isDismissed))
        }
    }

    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case let .setDismiss(isDismissed):
            state.isDismissed = isDismissed
            return state
        }
    }
    
    
}

