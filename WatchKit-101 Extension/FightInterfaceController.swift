//
//  FightInterfaceController.swift
//  WatchKit-101 Extension
//
//  Created by Burak Akin on 10.05.2020.
//  Copyright © 2020 Burak Akin. All rights reserved.
//

import WatchKit
import Foundation

class FightInterfaceController: WKInterfaceController {
    
    @IBOutlet var flightLabel: WKInterfaceLabel!
    @IBOutlet var routeLabel: WKInterfaceLabel!
    @IBOutlet var boardingLabel: WKInterfaceLabel!
    @IBOutlet var boardTimeLabel: WKInterfaceLabel!
    @IBOutlet var statusLabel: WKInterfaceLabel!
    @IBOutlet var gateLabel: WKInterfaceLabel!
    @IBOutlet var seatLabel: WKInterfaceLabel!
    
    var flight: Flight? {
        didSet {
            
            if let flight = flight {
                flightLabel.setText("Flight \(flight.shortNumber)")
                routeLabel.setText(flight.route)
                boardingLabel.setText("\(flight.number) Boards")
                boardTimeLabel.setText(flight.boardsAt)
                
                if flight.onSchedule {
                    statusLabel.setText("On Time")
                }
                else {
                    statusLabel.setText("Delayed")
                    statusLabel.setTextColor(.red)
                }
                
                gateLabel.setText("Gate \(flight.gate)")
                seatLabel.setText("Seat \(flight.seat)")
                
                
                
            }
            
        }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if let flight = context as? Flight {
            self.flight = flight
        }
        
        // Configure interface objects here.
    }
    
}
