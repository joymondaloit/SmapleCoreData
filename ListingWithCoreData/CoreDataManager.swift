//
//  CoreDataManager.swift
//  ListingWithCoreData
//
//  Created by Joy Mondal on 03/02/20.
//  Copyright © 2020 Techno-MAC. All rights reserved.
//

import UIKit
import CoreData
class CoreDataManager: NSObject {

    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    let manageObjectContext : NSManagedObjectContext
    var employeeDetails = [Employee]()
    static let shared = CoreDataManager()
    
    override init() {
        self.manageObjectContext = (appDelegate?.persistentContainer.viewContext)!
    }
    
    func saveData(empID : String, name: String,designation: String, completion : (Bool)->()){
        let empDetails = Employee(context: manageObjectContext)
                   empDetails.name = name
                   empDetails.designation = designation
                   empDetails.empID = empID
        do{
           try manageObjectContext.save()
            completion(true)
        }catch{
            completion(false)
        }
    }
    
    func deleteData(empID : String,completion : (String)->()){
        let fetchRequest = Employee.fetchRequest() as NSFetchRequest
        fetchRequest.predicate = NSPredicate(format: "empID == %@", empID)
        do{
            let result = try manageObjectContext.fetch(fetchRequest) as [Employee]
            for item in result{
                manageObjectContext.delete(item)
            }
            try manageObjectContext.save()
            completion("Deleted Successfully")
        }catch let error as NSError{
            completion(error.localizedDescription)
        }
        
    }
    
    func fetchData(compltion : ([Employee]?)->()){
        let fetchRequest = Employee.fetchRequest() as NSFetchRequest
        do{
            employeeDetails = try manageObjectContext.fetch(fetchRequest) as [Employee]
            compltion(employeeDetails)
        }catch{
            compltion(nil)
        }
        
    }
    func updateData(empId : String,designation : String,name : String){
        let fetchRequest = Employee.fetchRequest() as NSFetchRequest
        let predicate = NSPredicate(format: "empID == %@", empId)
        fetchRequest.predicate = predicate
        do {
            let result = try manageObjectContext.fetch(fetchRequest) as [Employee]
            for item in result{
                item.designation = designation
                item.name = name
                item.empID = empId
            }
            try manageObjectContext.save()
            
            
        }catch{
            
        }
    }
}
