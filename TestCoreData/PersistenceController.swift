//
//  PersistentController.swift
//  TestCoreData
//
//  Created by Nao RandD on 2023/07/08.
//

import Foundation
import CoreData

struct PersistenceController {
    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "SampleModel")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error: \(error)")
            }
        }
    }
}
