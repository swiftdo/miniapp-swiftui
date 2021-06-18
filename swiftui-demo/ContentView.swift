//
//  ContentView.swift
//  swiftui-demo
//
//  Created by laijihua on 2021/6/16.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            HomePage().tabItem {
                Image(systemName: "phone.fill")
                Text("首页")
            }
            RankPage().tabItem {
                Image(systemName: "phone.fill")
                Text("热榜")
            }
            MinePage().tabItem {
                Image(systemName: "phone.fill")
                Text("首页")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
