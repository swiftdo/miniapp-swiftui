//
//  CasePage.swift
//  swiftui-demo
//
//  Created by laijihua on 2021/7/3.
//

import SwiftUI
import ComposableArchitecture


struct CasePage: View {
    
    let store: Store<AppState, AppAction>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack {
                HStack {
                    Button("-") {
                        viewStore.send(.decrementButtonTapped)
                    }
                    Text("\(viewStore.count)")
                    Button("+") {
                        viewStore.send(.incrementButtonTapped)
                    }
                }
                Button("Number fact") {
                    viewStore.send(.numberFactButtonTapped)
                }
            }.alert(
                item: viewStore.binding(
                  get: { $0.numberFactAlert.map(FactAlert.init(title:)) },
                  send: .factAlertDismissed
                ),
                content: { Alert(title: Text($0.title)) }
              )
            
        }
    }
}

struct FactAlert: Identifiable {
    var title: String
    var id: String { self.title }
}

struct CasePage_Previews: PreviewProvider {
    static var previews: some View {
        CasePage(store: Store(initialState: AppState(), reducer: appReducer, environment: AppEnvironment(mainQueue: .main.eraseToAnyScheduler(), numberFact: {  number in
            Effect(value: "\(number) is a good number Brent")
        }))
        )
    }
}
