//
//  AppContext.swift
//  Transoft
//
//  Created by Anand Yadav on 07/08/16.
//  Copyright © 2016 Transoft. All rights reserved.
//

import UIKit

let _sharedContext: AppContext = { AppContext() }()

class AppContext: NSObject {
    var SessionID: NSString?
    
    // Singleton class
    class func sharedContext() -> AppContext {
        return _sharedContext
    }
    
    
    func setSessionId(id:NSString){
        SessionID = id
    }
    
}
