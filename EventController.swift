//
//  EventController.swift
//  EventManager
//
//  Created by Emily Asch on 2/17/22.
//

import CoreData

class EventController{
    //MARK: Shared instance
    static let shared = EventController()
    
    //MARK: SOT
    var events: [Event] = []
    
    private lazy var fetchRequest: NSFetchRequest<Event> = {
        let request = NSFetchRequest<Event>(entityName: "Event")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    
    //MARK: CRUD
    
    func create(title: String, date: Date, time: Date){
      //  print("inside create title \(title) date\(date) time\(time)")
        //under the hood the event is going into the context
         let newEvent = Event(title: title, date: date, time: date)
        events.append(newEvent)
        CoreDataStack.saveContext()
    }
    
    func fetchEvents(){
        let events = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
     //   print("how many events? \(events.count)")
        self.events = events
    }
  
    func updateEvents(event: Event, title: String, date: Date, time: Date){
        event.title = title
        event.date = date
        event.time = time
        CoreDataStack.saveContext()
    }
    
    //MARK: NOT SAVING
    func isAttendingEvent(event: Event){
        //print("👽inside isAttending what is event? \(event)")
         event.attendingToggle = !event.attendingToggle
        print("👀is attending toggle? \(event.attendingToggle)")
        CoreDataStack.saveContext()
    }
    
    func delete(event: Event){
        guard let index = events.firstIndex(of: event) else {return}
        events.remove(at: index)
        CoreDataStack.context.delete(event)
        CoreDataStack.saveContext()
                
    }
    
}
