//
//  MeetupInterfaceController.swift
//  WWCMeetup
//
//  Created by Snehal Patil on 8/12/16.
//  Copyright © 2016 Snehal Patil. All rights reserved.
//

import WatchKit
import Foundation


class MeetupInterfaceController: WKInterfaceController {
    @IBOutlet var timeLabel: WKInterfaceLabel!
    @IBOutlet var titleLabel: WKInterfaceLabel!
    
    
    // 1
    var meetup: Meetup? {
        // 2
        didSet {
            // 3
            if let meetup = meetup {
                // 4
                timeLabel.setText("\(meetup.starttime) to \(meetup.endtime)")
                titleLabel.setText(meetup.title)
            }
        }
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        if let meetup = context as? Meetup { self.meetup = meetup }
    }

}
