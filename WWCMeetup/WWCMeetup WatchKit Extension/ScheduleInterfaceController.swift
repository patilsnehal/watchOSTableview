//
//  ScheduleInterfaceController.swift
//  WWCMeetup
//
//  Created by Snehal Patil on 8/12/16.
//  Copyright © 2016 Snehal Patil. All rights reserved.
//

import WatchKit
import Foundation


class ScheduleInterfaceController: WKInterfaceController {

    @IBOutlet var WWCMeetupTable: WKInterfaceTable!
    var meetups = Meetup.allMeetups()

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Set up a Row count
        WWCMeetupTable.setNumberOfRows(meetups.count, withRowType: "WWCRow");
        
        // Add data for each row
        for index in 0..<WWCMeetupTable.numberOfRows {
            if let controller = WWCMeetupTable.rowControllerAtIndex(index) as? MeetupRowController {
                controller.meetup = meetups[index]
            }
        }
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        let meetup = meetups[rowIndex]
        presentControllerWithName("Meetup", context: meetup)
    }

}
