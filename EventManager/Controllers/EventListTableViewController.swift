//
//  EventListTableViewController.swift
//  EventManager
//
//  Created by Emily Asch on 2/17/22.
//

import UIKit

class EventListTableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        EventController.shared.fetchEvents()
        title = "Events"
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
  
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return EventController.shared.events.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     guard let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as? EventTableViewCell else {return UITableViewCell()}
        
        let event = EventController.shared.events[indexPath.row]
        cell.configure(with: event)
        cell.delegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let event = EventController.shared.events[indexPath.row]
            EventController.shared.delete(event: event)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //IIDOO
        //identifier
        if segue.identifier == "toEventDetailVC",
           let indexPath = tableView.indexPathForSelectedRow,
           let destination = segue.destination as? EventDetailViewController{
            //indexpath//destination
            print("what is index path? \(indexPath)")
            //object to send
            let eventToSend = EventController.shared.events[indexPath.row]
            print("event to send is? \(eventToSend)")
            //object to receive
            destination.event = eventToSend
        }
    }
    

}//end of class

extension EventListTableViewController: EventTableViewCellDelegate{
    func isAttendingButtonTapped(for cell: EventTableViewCell) {
        print("we are going to event self delegate to self")
        guard let indexPath = tableView.indexPath(for: cell) else {return}
        let event = EventController.shared.events[indexPath.row]
        
        EventController.shared.isAttendingEvent(event: event)
        cell.updateViews()
    }
    
}
