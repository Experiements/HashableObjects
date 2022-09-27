//
//  PersistenceController.swift
//  HashableObjects
//
//  Created by Chris Hand on 9/25/22.
//

import Foundation
import CoreData

struct PersistenceController {
    
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)
        
        for projectIndex in 0..<10 {
            let project = Projects(context: controller.container.viewContext)
            project.name = "Project #\(projectIndex)"
        }
        
        return controller
    }()
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Projects")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("ERROR: \(error.localizedDescription)")
            }
        }
    }
    
    func Save() {
        let context = container.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
