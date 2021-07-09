//
//  CasePageTCA.swift
//  swiftui-demo
//
//  Created by laijihua on 2021/7/3.
//

import ComposableArchitecture

struct AppState: Equatable {
    var count = 0
    var numberFactAlert: String?
}

enum AppAction: Equatable {
    /// 按下报警按钮时的操作
    case factAlertDismissed
    // 按下建好按钮
    case decrementButtonTapped
    // 按下加好按钮
    case incrementButtonTapped
    // 按下数字
    case numberFactButtonTapped
    // 数字引发的效果
    case numberFactResponse(Result<String, ApiError>)
}



struct AppEnvironment {
    var mainQueue: AnySchedulerOf<DispatchQueue>
    var numberFact: (Int) -> Effect<String, ApiError>
}

struct ApiError: Error, Equatable {
    
}

let appReducer = Reducer<AppState, AppAction, AppEnvironment> { state, action, environment in
    switch action {
    case .factAlertDismissed:
        state.numberFactAlert = nil
        return .none
    case .decrementButtonTapped:
        state.count -= 1
        return .none
    case .incrementButtonTapped:
        state.count += 1
        return .none
    case .numberFactButtonTapped:
        return environment.numberFact(state.count)
            .receive(on: environment.mainQueue)
            .catchToEffect()
            .map(AppAction.numberFactResponse)
    case let .numberFactResponse(.success(fact)):
        state.numberFactAlert = fact
        return .none
    case .numberFactResponse(.failure):
        state.numberFactAlert = "count not load a number fact"
        return .none
    }
    
}

