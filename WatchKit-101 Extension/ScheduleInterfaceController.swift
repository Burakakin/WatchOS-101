//
//  ScheduleInterfaceController.swift
//  WatchKit-101 Extension
//
//  Created by Burak Akin on 10.05.2020.
//  Copyright © 2020 Burak Akin. All rights reserved.
//

import WatchKit

class ScheduleInterfaceController: WKInterfaceController {

    @IBOutlet weak var flightsTable: WKInterfaceTable!
    
    var flights = Flight.allFlights()
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        flightsTable.setNumberOfRows(flights.count, withRowType: "FlightRow")
        
        for index in 0..<flightsTable.numberOfRows {
            if let controller = flightsTable.rowController(at: index) as? FlightRowController {
                controller.flight = flights[index]
            }
        }
    }
    
    
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        let flight = flights[rowIndex]
        pushController(withName: "FightInterfaceController", context: flight)
    }
}
