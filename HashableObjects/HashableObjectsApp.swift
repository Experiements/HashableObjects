//
//  HashableObjectsApp.swift
//  HashableObjects
//
//  Created by Chris Hand on 9/25/22.
//

import SwiftUI

@main
struct HashableObjectsApp: App {
    
    let persistenceController = PersistenceController.shared
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
