//
//  APIManager.swift
//  MusicVideo
//
//  Created by wesley on 19/03/2016.
//  Copyright © 2016 wesley. All rights reserved.
//

import Foundation

class APIManager {
    
    func loadData(urlString:String, completion: (result:String) ->Void){
        
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        
        let session = NSURLSession(configuration:  config)
        
//        let session = NSURLSession.sharedSession()
        let url = NSURL(string: urlString)!
        
        
        let task = session.dataTaskWithURL(url) {
            (data, response, error) -> Void in
           
            if error != nil {
                dispatch_async(dispatch_get_main_queue()) {
                    completion(result: (error!.localizedDescription))
                }
                
            } else {
                //Added for JSONSerialization
                //print(data)
                do {
                    /* .AllowFragments - top level object is not an array or dictionary.
                        any type of string or value
                        NSJSONSerialization requires the do / Try / Catch
                        Converts the NSData into JSON Object and cast it to a dictionary */
                    if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                        as? [String: AnyObject] {
                            
                            print(json)
                            
                            let priority = DISPATCH_QUEUE_PRIORITY_HIGH
                            dispatch_async(dispatch_get_global_queue(priority, 0)) {
                                dispatch_async(dispatch_get_main_queue()) {
                                    completion(result: "JSONSerialisation Successful")
                                }
                            }
                    }
                } catch {
                    dispatch_async(dispatch_get_main_queue()) {
                        completion(result: "error in NSJsonserialization")
                    }
                    
                }
                // end of JSONSerialzation
            }
        }
        task.resume()
    }

}