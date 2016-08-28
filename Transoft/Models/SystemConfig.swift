//
//  SystemConfig.swift
//  Transoft
//
//  Created by Anand Yadav on 07/08/16.
//  Copyright © 2016 Transoft. All rights reserved.
//

import UIKit

class SystemConfig: NSObject {
    var deviceId:String?    //Unique ID of the device.
    //It can be custom or It may be IDFV/IDFA in case of iOS and A4SID in case of Android. Platform developer to decide what to use.
    var deviceToken:String?     //Device token which received from APN and GCM, will be used to send push notifications.
    var deviceModel:String?
    var applicationVersion:String?
    
    init(deviceId: String, deviceToken: String, deviceModel: String, applicationVersion: String) {
        self.deviceId = deviceId
        self.deviceToken = deviceToken
        self.deviceModel = deviceModel
        self.applicationVersion = applicationVersion
    }

}
