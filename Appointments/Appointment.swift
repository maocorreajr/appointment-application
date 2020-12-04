//
//  Appointment.swift
//  COPApp
//
//  Updates by Julian Mauricio Correa on 12/2/20.
//  Copyright © 2020 Julian Mauricio Correa. All rights reserved.
//

import Foundation
import Firebase

struct Appointment {
    
    //var id : String = ""
    var startTime: Date = Date()
    var endTime : Date = Date()
    var duration : Int = 0
    var description : String = ""
    var ownerId : String = ""
    var customerUsername : String = ""
    var customerName: String = ""
    var ownerName : String = ""
    var status : String = ""
    var date : String = ""
    var documentId : String = ""
    
    var dictionary : [String: Any] {
        return [
           // "id": id,
            "startTime": startTime,
            "endTime": endTime,
            "duration": duration,
            "description": description,
            "ownerId": ownerId,
            "customerUsername": customerUsername,
            "customerName" : customerName,
            "ownerName" : ownerName,
            "status": status,
            "date": date,
            "documentId" : documentId
        ]
    }
}

extension Appointment : DocumentSerializable {
    init?(dictionary: [String : Any]) {
       // guard let id = dictionary["id"] as? String,
        guard let duration = dictionary["duration"] as? Int,
            let description = dictionary["description"] as? String,
            let ownerId = dictionary["ownerId"] as? String,
            let customerUsername = dictionary["customerUsername"] as? String,
            let customerName = dictionary["customerName"] as? String,
            let ownerName = dictionary["ownerName"] as? String,
            let date = dictionary["date"] as? String,
            let documentId = dictionary["documentId"] as? String,
            let status = dictionary["status"] as? String else {return nil}
        
        var startTime = Date(), endTime = Date()
        
        if let startT = dictionary["startTime"] as? Timestamp  {
            startTime = Date(timeIntervalSince1970: Double(startT.seconds))

            let formatter = DateFormatter()
            formatter.dateStyle = .long
            formatter.timeStyle = .long
            
            
            formatter.timeZone = TimeZone(abbreviation: TimeZone.current.abbreviation()!)
            
            let startTimeString = formatter.string(from: startTime)
            print("Start Time String: ", startTimeString)
            print("Curren Timezone: ", TimeZone.current.abbreviation()!)
            formatter.timeZone = TimeZone(abbreviation: TimeZone.current.abbreviation()!)
            startTime = formatter.date(from: startTimeString)!
        }
        
        if let endT = dictionary["endTime"] as? Timestamp {
            endTime = Date(timeIntervalSince1970: Double(endT.seconds))

            let formatter = DateFormatter()
            formatter.dateStyle = .long
            formatter.timeStyle = .long
            
            formatter.timeZone = TimeZone(abbreviation: TimeZone.current.abbreviation()!)

            let endTimeString = formatter.string(from: endTime)
            
            print("EndTimeString:", endTimeString)
            formatter.timeZone = TimeZone(abbreviation: TimeZone.current.abbreviation()!)
            endTime = formatter.date(from: endTimeString)!
        }
        
        self.init(//id : id,
                  startTime: startTime,
                  endTime: endTime,
                  duration: duration,
                  description: description,
                  ownerId: ownerId,
                  customerUsername : customerUsername,
                  customerName: customerName,
                  ownerName: ownerName,
                  status: status,
                  date: date,
                  documentId: documentId)
    }
}
