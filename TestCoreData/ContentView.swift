//
//  ContentView.swift
//  TestCoreData
//
//  Created by Nao RandD on 2023/07/08.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(entity: Player.entity(), sortDescriptors: []) var fetchedPlayerList: FetchedResults<Player>
    @State var name: String = ""
    @State var selectTitle: Title = .none

    var body: some View {
        List(fetchedPlayerList) { player in
            if let name = player.name,
               let data = player.title,
               let title = try? JSONDecoder().decode(Title.self, from: data){
                VStack {
                    Text("棋士名：\(name)")
                    Text("タイトル：\(title.rawValue)")
                }
            }
        }
        TextField("棋士の名前を入れる", text: $name)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 20, trailing: 20))
        Picker("タイトル", selection: $selectTitle) {
            ForEach(Title.allCases) {
                Text($0.rawValue).tag($0)
            }
        }
        Button("棋士を追加", action: addPlayer)
    }

    func addPlayer() {
        let player = Player(context: viewContext)
        player.name = name

        do {
            let data = try JSONEncoder().encode(selectTitle)
            player.title = data

            try viewContext.save()
        } catch {
            fatalError("Fail to save")
        }
        name = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
