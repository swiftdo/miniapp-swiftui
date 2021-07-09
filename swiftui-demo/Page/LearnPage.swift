//
//  LearnPage.swift
//  swiftui-demo
//
//  Created by laijihua on 2021/7/8.
//

import SwiftUI

/// 需要实现 Identifiable 协议
struct TodoItem: Identifiable {
    var id: UUID = UUID()
    var task: String
    var imgName: String
}

struct LearnPage: View {
    
    @State var listData: [TodoItem] = [
        TodoItem(task: "写一篇SwiftUI文章", imgName: "pencil.circle"),
        TodoItem(task: "看WWDC视频", imgName: "square.and.pencil"),
        TodoItem(task: "定外卖", imgName: "folder"),
        TodoItem(task: "关注OldBirds公众号", imgName: "link"),
        TodoItem(task: "6点半跑步2公里", imgName: "moon"),
    ]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("待办事项")) {
                    ForEach(listData) { item in
                        HStack{
                            Image(systemName: item.imgName)
                            Text(item.task)
                        }
                    }
                    .onDelete(perform: deleteItem)
                    .onMove(perform: moveItem)
                }
                Section(header: Text("其他内容")) {
                    Text("Hello World")
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle(Text("待办清单"))
        }
    }
    
    func moveItem(from source: IndexSet, to destination: Int) {
        listData.move(fromOffsets: source, toOffset: destination)
    }
    
    func deleteItem(at offsets: IndexSet) {
        listData.remove(atOffsets: offsets)
    }
}

struct LearnPage_Previews: PreviewProvider {
    static var previews: some View {
        LearnPage()
    }
}
