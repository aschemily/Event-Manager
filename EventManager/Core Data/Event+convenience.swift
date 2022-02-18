//
//  Event+convenience.swift
//  EventManager
//
//  Created by Emily Asch on 2/17/22.
//

import CoreData

extension Event{
    @discardableResult convenience init(title: String, date: Date, time: Date, attendingToggle:Bool = false, context: NSManagedObjectContext = CoreDataStack.context){
        self.init(context: context)
        self.title = title
        self.date = date
        self.time = time
        self.attendingToggle = attendingToggle
        self.id = UUID().uuidString
    }
    
    
}//end of extension
