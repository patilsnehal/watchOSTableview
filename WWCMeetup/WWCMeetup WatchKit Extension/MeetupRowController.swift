//
//  MeetupRowController.swift
//  WWCMeetup
//
//  Created by Snehal Patil on 8/12/16.
//  Copyright © 2016 Snehal Patil. All rights reserved.
//

import WatchKit

class MeetupRowController: NSObject {
    @IBOutlet var timeLabel: WKInterfaceLabel!
    @IBOutlet var titleLabel: WKInterfaceLabel!
    
    // 1
    var meetup: Meetup? {
        // 2 Add a property observer that is triggered whenever the property is set;
        didSet {
            // 3 Check of meetup is not nil
            if let meetup = meetup {
                // 4  configure the labels using the relevant properties of meetup
                timeLabel.setText(meetup.starttime)
                titleLabel.setText(meetup.title)
            }
        }
    }

}
