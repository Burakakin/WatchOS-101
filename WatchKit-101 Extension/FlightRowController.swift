//
//  FlightRowController.swift
//  WatchKit-101 Extension
//
//  Created by Burak Akin on 10.05.2020.
//  Copyright © 2020 Burak Akin. All rights reserved.
//

import WatchKit

class FlightRowController: NSObject {
    
    @IBOutlet var separator: WKInterfaceSeparator!
    @IBOutlet var originLabel: WKInterfaceLabel!
    @IBOutlet var destinationLabel: WKInterfaceLabel!
    @IBOutlet var flightNumberLabel: WKInterfaceLabel!
    @IBOutlet var statusLabel: WKInterfaceLabel!
    @IBOutlet var planeImage: WKInterfaceImage!
    
    
    var flight: Flight? {
        didSet {
            
            if let flight = flight {
                originLabel.setText(flight.origin)
                destinationLabel.setText(flight.destination)
                flightNumberLabel.setText(flight.number)
                if flight.onSchedule {
                    statusLabel.setText("On Time")
                } else {
                    statusLabel.setText("Delayed")
                    statusLabel.setTextColor(.red)
                }
            }
            
        }
    }
    
}
