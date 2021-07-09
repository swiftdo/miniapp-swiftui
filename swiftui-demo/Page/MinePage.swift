//
//  MinePage.swift
//  swiftui-demo
//
//  Created by laijihua on 2021/6/18.
//

import SwiftUI

func cal() {
    for i in stride(from: -1, to: 1, by: 0.01) {
        print(i)
    }
}

struct MinePage: View {
    var body: some View {
        Text("MinePage")
    }
}

struct MinePage_Previews: PreviewProvider {
    static var previews: some View {
        MinePage()
    }
}
