//
//  Flight.swift
//  AirAber
//
//  Created by Mic Pringle on 05/08/2015.
//  Copyright © 2015 Mic Pringle. All rights reserved.
//

import WatchKit

class Meetup {
  let title: String
  let starttime: String
  let endtime: String
   
  class func allMeetups() -> [Meetup] {
    var meetups = [Meetup]()
    if let path = NSBundle.mainBundle().pathForResource("Meetup", ofType: "json"), let data = NSData(contentsOfFile: path) {
      do {
        let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! [Dictionary<String, String>]
        for dict in json {
          let meetup = Meetup(dictionary: dict)
          meetups.append(meetup)
        }
      } catch {
        print(error)
      }
    }
    return meetups
  }
    
  init( title: String, starttime: String, endtime: String) {
    self.title = title
    self.starttime = starttime
    self.endtime = endtime
  }
  
  convenience init(dictionary: [String: String]) {
    let title = dictionary["title"]!
    let starttime = dictionary["startTime"]!
    let endtime = dictionary["endTime"]!
    self.init(title: title, starttime: starttime, endtime: endtime)
  }
}