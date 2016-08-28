//
//  TransoftServices.swift
//  Transoft
//
//  Created by Anand Yadav on 07/08/16.
//  Copyright © 2016 Transoft. All rights reserved.
//

import UIKit

let _sharedInstance:TransoftServices = {TransoftServices()}()

class TransoftServices: NSObject {
    
    class func sharedInstance() -> TransoftServices {
        return _sharedInstance
    }
    
    func HTTPGetRequest(request: NSMutableURLRequest,callback: (NSData?, String?) -> Void) {
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request,completionHandler :{data, response, error -> Void in
            if error != nil {
                callback(nil, (error!.localizedDescription) as String)
            } else {
                if let httpResponse = response as? NSHTTPURLResponse {
                    if let sessionID = httpResponse.allHeaderFields["Set-Cookie"] as? String {
                        AppContext.sharedContext().setSessionId(sessionID)
                    }
                }
                callback(data!,nil)
            }
        })
        task.resume()
    }
    
    func GetCaptcha(callback: (NSData?, String?) -> Void) {
        let request = NSMutableURLRequest(URL: NSURL(string: Helper.ServiceURL.captcha.rawValue)!)
        request.HTTPMethod = "GET"
        HTTPGetRequest(request, callback: callback)
    }
    
    func HTTPPostRequest(request: NSMutableURLRequest,callback: (succeeded: Bool, msg: String) -> ()) {
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            print("Response: \(response)")
            let strData = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("Body: \(strData)")
            let json: NSDictionary?
            do {
                json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableLeaves) as? NSDictionary
            } catch let dataError {
                print(dataError)
                let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print("Error could not parse JSON: '\(jsonStr)'")
                return
            }
            
            if let parseJSON = json {
                let success = parseJSON["success"] as? Int
                print("Succes: \(success)")
            }
            else {
                let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print("Error could not parse JSON: \(jsonStr)")
            }
        })
        
        task.resume()
    }
    
    
    func getRegister(callback: (succeeded: Bool, msg: String) -> Void){
        let request = NSMutableURLRequest(URL: NSURL(string: Helper.ServiceURL.register.rawValue)!)
        request.HTTPMethod = "POST"
        do {
            var requestParams=Dictionary<String,AnyObject>()
            requestParams = getDeviceConfig()
            requestParams["Cookie"] = AppContext.sharedContext().SessionID
            requestParams["userDetail"] = getUserDetails()
            request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(requestParams, options: .PrettyPrinted)
        } catch{
            return
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        print("Header :",request.allHTTPHeaderFields)
        HTTPPostRequest(request, callback: callback)
    }
    
    
    func getActivate(password:String, otp:String, callback: (succeeded: Bool, msg: String) -> Void){
        let hashPassword = password.sha512()
        let hashOtp = otp.sha512()
        
        let request = NSMutableURLRequest(URL: NSURL(string: Helper.ServiceURL.activate.rawValue)!)
        request.HTTPMethod = "POST"
        do {
            var requestParams=Dictionary<String,AnyObject>()
            requestParams["Cookie"] = AppContext.sharedContext().SessionID
            requestParams["password"] = hashPassword.toBase64()
            requestParams["otp"] = hashOtp.toBase64()
            
            request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(requestParams, options: .PrettyPrinted)
        } catch{
            return
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        print("Header :",request.allHTTPHeaderFields)
        HTTPPostRequest(request, callback: callback)
    }
    
}

