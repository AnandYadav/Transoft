//
//  CommonDataProvider.swift
//  Transoft
//
//  Created by Anand Yadav on 07/08/16.
//  Copyright © 2016 Transoft. All rights reserved.
//

import UIKit

class CommonDataProvider: NSObject {

}
func getUserDetails()->Dictionary<String, String>{
    var userDetails = Dictionary<String, String>()
    userDetails["firstName"] = "Kaptan"
    userDetails["lastName"] = "Parihar"
    userDetails["mobileNumber"] = "9051773864"//1,2,3,4
    userDetails["gender"] = "M"
    userDetails["emailAddress"] = "parihar.kaptan@gmail.com"
    userDetails["dateOfBirth"] = "25-05-1983"
    userDetails["placeOfBirth"] = "Gwalior"
    userDetails["documentId"] = "ABCD1234"
    userDetails["documentType"] = "P"
    userDetails["documentIssuePlace"] = "Bhopal"
    
    return userDetails
}

func getDeviceConfig() -> Dictionary<String,String>{
    
    var deviceConfig = Dictionary<String, String>()
    deviceConfig["deviceId"] = "6752165316"
    deviceConfig["deviceToken"] = "token"
    deviceConfig["devicePlatform"] = "iOS"
    deviceConfig["deviceModel"] = "iPhone 5"
    deviceConfig["applicationVersion"] = "1.0"
    deviceConfig["captcha"] = "123abc"
    deviceConfig["locale"] = "en_US"
    deviceConfig["applicationName"] = "ecoject"
    
    return deviceConfig
}
