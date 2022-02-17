//
//  EventDetailViewController.swift
//  EventManager
//
//  Created by Emily Asch on 2/17/22.
//

import UIKit

class EventDetailViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var timePicker: UIDatePicker!
    
    @IBOutlet weak var eventTitleTextField: UITextField!
    
    @IBOutlet weak var eventLabel: UILabel!
    var event: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let event = event,
           let date = event.date,
           let time = event.time{
            eventLabel.text = "Event Details"
            eventTitleTextField.text = event.title
            datePicker.date = date
            timePicker.date = time
        }else{
            eventLabel.text = "Create New Event"
        }

    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        print("save button tapped")
        guard let title = eventTitleTextField.text, !title.isEmpty else {return}
        let date = datePicker.date
        let time = timePicker.date
 
        if let event = event{
            EventController.shared.updateEvents(event: event, title: title, date: date, time: time)
        }else{
            EventController.shared.create(title: title, date: date, time: time)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    

}//end of class
