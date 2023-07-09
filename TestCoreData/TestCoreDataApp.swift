//
//  TestCoreDataApp.swift
//  TestCoreData
//
//  Created by Nao RandD on 2023/07/08.
//

import SwiftUI

@main
struct TestCoreDataApp: App {
    let persistenceController = PersistenceController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
