//
//  Employee+CoreDataProperties.swift
//  ListingWithCoreData
//
//  Created by Joy Mondal on 03/02/20.
//  Copyright © 2020 Techno-MAC. All rights reserved.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var name: String?
    @NSManaged public var empID: String?
    @NSManaged public var designation: String?

}
