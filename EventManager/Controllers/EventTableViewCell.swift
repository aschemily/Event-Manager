//
//  EventTableViewCell.swift
//  EventManager
//
//  Created by Emily Asch on 2/17/22.
//

import UIKit

protocol EventTableViewCellDelegate: AnyObject{
    func isAttendingButtonTapped(for cell: EventTableViewCell)
}

class EventTableViewCell: UITableViewCell {
    
    @IBOutlet weak var EventTitleLabel: UILabel!
    @IBOutlet weak var isAttendingButton: UIButton!
    
    var event: Event?
    var isAttendingEvent: Bool = false
    weak var delegate: EventTableViewCellDelegate?
    
    func updateViews(){
       print("event tableview cell update views function")
        guard let event = event else{return}
        
        if event.isAttending == true{
            isAttendingButton.setImage(UIImage(systemName: "person.fill.checkmark"), for: .normal)
           
        }else{
            isAttendingButton.setImage(UIImage(systemName: "person.fill.xmark"), for: .normal)
        }
        CoreDataStack.saveContext()
    }
    
   
    @IBAction func isAtttendingButtonTapped(_ sender: Any) {
        print("is attending tapped")
        delegate?.isAttendingButtonTapped(for: self)
      
    }
    
    func configure(with event: Event){
        self.event = event
        EventTitleLabel.text = event.title
    }
    
}
