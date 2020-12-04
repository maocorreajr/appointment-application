//
//  User.swift
//  COPApp
//
//  Updates by Julian Mauricio Correa on 12/2/20.
//  Copyright © 2020 Julian Mauricio Correa. All rights reserved.
//

import Foundation

struct Customer {
    
    var firstName : String = ""
    var lastName : String = ""
    var emailId : String = ""
    var username : String = ""
    var phoneNumber : String = ""
    var appointmentSubject : String = ""
    var customerId : String = ""
    var fcmToken : String = ""
    var profilePictureUrl : String = ""
    
    var dictionary : [String: Any] {
        return [
            "firstName": firstName,
            "lastName": lastName,
            "emailId": emailId,
            "username" : username,
            "phoneNumber" : phoneNumber,
            "appointmentSubject": appointmentSubject,
            "customerId": customerId,
            "fcmToken" : fcmToken,
            "profilePictureUrl" : profilePictureUrl
            
        ]
    }
}

extension Customer : DocumentSerializable {
    init?(dictionary: [String : Any]) {
        guard let firstName = dictionary["firstName"] as? String,
            let lastName = dictionary["lastName"] as? String,
            let emailId = dictionary["emailId"] as? String,
            let username = dictionary["username"] as? String,
            let phoneNumber = dictionary["phoneNumber"] as? String,
            let customerId = dictionary["customerId"] as? String,
            let fcmToken = dictionary["fcmToken"] as? String,
            let appointmentSubject = dictionary["appointmentSubject"] as? String,
        let profilePictureUrl = dictionary["profilePictureUrl"] as? String else { return nil }
        
        self.init(firstName: firstName,
                  lastName: lastName,
                  emailId: emailId,
                  username: username,
                  phoneNumber: phoneNumber,
                  appointmentSubject: appointmentSubject,
                  customerId: customerId,
                  fcmToken: fcmToken,
                  profilePictureUrl: profilePictureUrl)
    }
}

