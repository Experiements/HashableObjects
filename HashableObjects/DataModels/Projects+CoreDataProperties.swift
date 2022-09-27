//
//  Projects+CoreDataProperties.swift
//  HashableObjects
//
//  Created by Chris Hand on 9/25/22.
//
//

import Foundation
import CoreData


extension Projects {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Projects> {
        return NSFetchRequest<Projects>(entityName: "Projects")
    }

    @NSManaged public var coreName: String?
    @NSManaged public var coreProjectDescription: String?
    @NSManaged public var coreCreateDtTm: Date?

}

extension Projects : Identifiable {

    public var name : String {
        get {
            return coreName ?? ""
        }
        set(newName) {
            coreName = newName
        }
    }
    
    public var projectSescription : String {
        return coreProjectDescription ?? ""
    }
    
    public var createDate : Date {
        return coreCreateDtTm ?? Date.now
    }
}
