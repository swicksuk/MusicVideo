//
//  APIManager.swift
//  MusicVideo
//
//  Created by Steve Wicks on 15/05/2016.
//  Copyright © 2016 swicks. All rights reserved.
//

import Foundation

class APIManager{
    
    func loadData(urlString:String, completion: (result:String) -> Void){
        
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        
        let session = NSURLSession(configuration: config)
        
        let url = NSURL(string: urlString)!
        
        let task = session.dataTaskWithURL(url){
            (data, response, error) -> Void in
            
            dispatch_async(dispatch_get_main_queue()) {
                if error != nil {
                    completion(result: (error!.localizedDescription))
                }else{
                    do {
                        if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                            as? JSONDictionary {
                                print(json)
                            
                                let res = Videos(data: json)
                            _ = res.vName
                            
                            
                                let priority = DISPATCH_QUEUE_PRIORITY_HIGH
                                dispatch_async(dispatch_get_global_queue(priority, 0)) {
                                    dispatch_async(dispatch_get_main_queue()) {
                                        completion(result: "JSONSerialization Successful")
                                    }
                                }
                            }
                        } catch {
                            dispatch_async(dispatch_get_main_queue()) {
                                completion(result: "error in NSJSONSerialization")
                            }
                        }
                    }
        }
    }
    task.resume()
    }
}