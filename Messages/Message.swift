//
//  Message.swift
//  Messages
//
//  Created by Rafael Moura on 26/09/16.
//  Copyright © 2016 Rafael Moura. All rights reserved.
//

import UIKit
import Alamofire

class Message: NSObject {

    
    private var record: [String: AnyObject]
    
    var id: Int {
        get {
            return record["id"] as! Int
        }
    }
    
    var sender: String {
        
        get {
            return record["sender"] as! String
        }
        
        set {
            record["sender"] = newValue as AnyObject
        }
    }
    
    var subject: String {
        
        get {
            return record["subject"] as! String
        }
        
        set {
            record["subject"] = newValue as AnyObject
        }
    }
    
    
    var text: String {
        
        get {
            return record["text"] as! String
        }
        
        set {
            record["text"] = newValue as AnyObject
        }
    }
    
    var created: String {
        get {
            return record["created_at"] as! String
        }
    }
    
    private init(withRecord record: [String: AnyObject]) {
        self.record = record
        super.init()
    }
    
    private init(withSender sender: String, subject: String, andText text: String) {
        
        self.record = [String: AnyObject]()
        self.record["sender"] = sender as AnyObject
        self.record["subject"] = subject as AnyObject
        self.record["text"] = text as AnyObject
        
        super.init()
    }
    
    static func list(completionHandler: @escaping ([Message]) -> ()) {
        Alamofire.request("http:/localhost:3000/emails").responseJSON { response in
            if let JSON = response.result.value as? [[String : AnyObject]] {
                let messages = JSON.map { object in
                    return Message(withRecord: object)
                }
                
                completionHandler(messages)
            }
        }
    }
    
    static func createMessageWithSender(sender: String, subject: String, text: String, completionHandler: @escaping (Message?) -> ()) {
        let parameters = ["sender" : sender, "subject" : subject, "text" : text]
        Alamofire.request("http:/localhost:3000/emails", method: .post, parameters: parameters).responseJSON { response in
            if let JSON = response.result.value as? [String : AnyObject] {
                let message = Message(withRecord: JSON)
                completionHandler(message)
            }
        }
    }
}
