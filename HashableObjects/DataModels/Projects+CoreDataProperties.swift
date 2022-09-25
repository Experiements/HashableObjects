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
    @NSManaged public var coreDescription: String?
    @NSManaged public var coreCreateDtTm: Date?

}

extension Projects : Identifiable {

    public var Name : String {
        return coreName ?? ""
    }
    
    public var Description : String {
        return coreDescription ?? ""
    }
    
    public var CreateDate : Date {
        return coreCreateDtTm ?? Date.now
    }
}
