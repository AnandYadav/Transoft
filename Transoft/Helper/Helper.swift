//
//  Helper.swift
//  Transoft
//
//  Created by Anand Yadav on 07/08/16.
//  Copyright © 2016 Transoft. All rights reserved.
//

import UIKit

class Helper: NSObject {
    enum ServiceURL: String {
        case captcha = "http://kaptan-kaptan.rhcloud.com/mobile/appLifeCycle/captcha"
        case register = "http://kaptan-kaptan.rhcloud.com/mobile/appLifeCycle/register"
        case activate = "http://kaptan-kaptan.rhcloud.com/mobile/appLifeCycle/activate"
        case login = "http://kaptan-kaptan.rhcloud.com/mobile/appLifeCycle/login"
    }
}
