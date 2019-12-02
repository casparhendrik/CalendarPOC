//
//  ViewController.swift
//  CalendarApp
//
//  Created by Caspar van Boom on 01/12/2019.
//  Copyright © 2019 Caspar van Boom. All rights reserved.
//

import UIKit
import EventKit
import EventKitUI

class CalendarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var calendar = Calendar.current
    let eventStore = EKEventStore()
    var events = [EKEvent]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllEvents()
        tableView.reloadData()
    }
    
    func getAllEvents() {
        var oneDayAgoComponents = DateComponents()
        oneDayAgoComponents.day = -1
        let oneDayAgo = calendar.date(byAdding: oneDayAgoComponents, to:Date())
        
        var OneYearFromNowComponents = DateComponents()
        OneYearFromNowComponents.year = 1
        let oneYearFromNow = calendar.date(byAdding: OneYearFromNowComponents, to: Date())
        
        var events: [EKEvent]? = nil
        
        func fetchEvents() {
            var predicate: NSPredicate? = nil
            predicate = eventStore.predicateForEvents(withStart: oneDayAgo!, end: oneYearFromNow!, calendars: nil)
            if let aPredicate = predicate {
                events = eventStore.events(matching: aPredicate)
            }
        }
        
        if EKEventStore.authorizationStatus(for: EKEntityType.event) == EKAuthorizationStatus.authorized {
            fetchEvents()
        } else {
            eventStore.requestAccess( to: EKEntityType.event, completion: {(granted, error) in
                if (granted) && (error == nil) {
                    fetchEvents()
                }
            })
        }
        
        self.events = events!
        tableView.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! calendarEventRow
        
        if let event = events[indexPath.row].title {
            cell.calendarRow.text = events[indexPath.row].title
        } else {
            cell.calendarRow.text = ""
        }
        
        print(cell.textLabel!.text)
        
        return cell
    }
}

class calendarEventRow: UITableViewCell {
    
    @IBOutlet weak var calendarRow: UILabel!
    
}

