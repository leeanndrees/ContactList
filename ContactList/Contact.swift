//
//  Contact.swift
//  ContactList
//
//  Created by DetroitLabs on 9/6/18.
//  Copyright © 2018 DetroitLabs. All rights reserved.
//

import Foundation

struct Contact {
    var firstName = ""
    var lastName = ""
    var phoneNumber = ""
}

extension Contact {
   static var allContacts: [Contact] = [
    Contact(firstName: "Hermione", lastName: "Granger", phoneNumber: "555-236-1782"),
    Contact(firstName: "Ron", lastName: "Weasley", phoneNumber: "555-678-9234"),
    Contact(firstName: "Rubeus", lastName: "Hagrid", phoneNumber: "555-678-9234"),
    Contact(firstName: "Ginny", lastName: "Weasley", phoneNumber: "555-678-9236"),
    Contact(firstName: "Luna", lastName: "Lovegood", phoneNumber: "555-678-9234"),
    Contact(firstName: "Neville", lastName: "Longbottom", phoneNumber: "555-678-9234"),
    ]
}
    

