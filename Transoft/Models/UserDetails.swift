//
//  UserDetails.swift
//  Transoft
//
//  Created by Anand Yadav on 07/08/16.
//  Copyright © 2016 Transoft. All rights reserved.
//

import UIKit

class UserDetails: NSObject {
    var firstName:String?
    var lastName:String?
    var mobileNumber:String?
    var gender:String?
    var emailAddress:String?
    var dateOfBirth:String?
    var placeOfBirth:String?
    var documentId:String?
    var documentType:String?
    var documentIssuePlace:String?
    
    init(firstName: String, lastName: String, mobileNumber: String, gender: String, emailAddress: String, dateOfBirth: String, placeOfBirth: String, documentId: String, documentType: String, documentIssuePlace: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.mobileNumber = mobileNumber
        self.gender = gender
        self.emailAddress = emailAddress
        self.dateOfBirth = dateOfBirth
        self.placeOfBirth = placeOfBirth
        self.documentId = documentId
        self.documentType = documentType
        self.documentIssuePlace = documentIssuePlace
    }

}
