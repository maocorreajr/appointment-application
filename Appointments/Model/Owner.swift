//
//  Professor.swift
//  COPApp
//
//  Updates by Julian Mauricio Correa on 12/2/20.
//  Copyright © 2020 Julian Mauricio Correa. All rights reserved.
//

import Foundation
import Firebase

struct Owner {
    
    var ownerId: String = ""
    var firstName: String = ""
    var lastName: String = ""
    var emailId: String = ""
    var phoneNumber: String = ""
    var fcmToken : String = ""
    var Schedule: Dictionary<String,Any> = [String: Any]()
    
    var dictionary: [String : Any] {
        return [
            "ownerId": ownerId,
            "firstName": firstName,
            "lastName": lastName,
            "emailId": emailId,
            "phoneNumber": phoneNumber,
            "fcmToken" : fcmToken,
            "Schedule": Schedule
        ]
    }
}

extension Owner: DocumentSerializable {
    init?(dictionary: [String : Any]) {
        guard let ownerId = dictionary["ownerId"] as? String,
            let firstName = dictionary["firstName"] as? String,
            let lastName = dictionary["lastName"] as? String,
            let emailId = dictionary["emailId"] as? String,
            let phoneNumber = dictionary["phoneNumber"] as? String,
            let fcmToken = dictionary["fcmToken"] as? String,
            let Schedule = dictionary["Schedule"] as? [String: Any] else { return nil }
        
        self.init(ownerId: ownerId,
                  firstName: firstName,
                  lastName: lastName,
                  emailId: emailId,
                  phoneNumber: phoneNumber,
                  fcmToken: fcmToken,
                  Schedule: Schedule)
    }
}

protocol DocumentSerializable {
    init?(dictionary: [String: Any])
}
