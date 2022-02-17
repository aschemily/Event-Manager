//
//  CoreDataStack.swift
//  EventManager
//
//  Created by Emily Asch on 2/17/22.
//

import CoreData

enum CoreDataStack{
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "EventManager")
        container.loadPersistentStores{storeDescription, error in
            if let error = error{
                fatalError("❌error loading in persistent stores \(error)")
            }
        }
        return container
    }()
    
    static var context: NSManagedObjectContext {container.viewContext}
    
    static func saveContext(){
        if context.hasChanges{
            do{
                try context.save()
            }catch{
                print("❌error saving context\(error)")
            }
        }
    }
    
    
}//end of enum
