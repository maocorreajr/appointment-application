//
//  ProfSchedule.swift
//  COPApp
//
//  Updates by Julian Mauricio Correa on 12/2/20.
//  Copyright © 2020 Julian Mauricio Correa. All rights reserved.
//

import Foundation

struct ProfSchedule {
    
    var ownerId : String = ""
    var dayOfTheWeek : String = ""
    var isAvailableToday : Bool = false
    var schedule : [Schedule] = [Schedule]()
//
//    var dictionary : [String:Any] {
//        return [
//            "dayOfTheWeek": dayOfTheWeek,
//            "isAvailableToday": isAvailableToday,
//            "schedule": schedule
//        ]
//    }
//    
//}
//
//extension ProfSchedule: DocumentSerializable {
//    init?(dictionary: [String : Any]) {
//        
//        for everyValues in dictionary {
//            dayOfTheWeek = values.key
//            
//            if let availableToday = value.value["isAvailableToday"] as? Bool {
//                isAvailableToday = availableToday
//                
//                if isAvailableToday {
//                    
//                    if let sc = dictionary["schedule"] as? [String: Any] {
//                        schedule = sc
//                    }
//                }
//            }
//        }
//
//        self.init(profId: profId, dayOfTheWeek: dayOfTheWeek,
//                  isAvailableToday: isAvailableToday,
//                  schedule : schedule)
//    }

}
