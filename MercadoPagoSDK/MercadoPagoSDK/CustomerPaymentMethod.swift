//
//  CustomerPaymentMethod.swift
//  MercadoPagoSDK
//
//  Created by Maria cristina rodriguez on 4/8/16.
//  Copyright © 2016 MercadoPago. All rights reserved.
//

import UIKit

public class CustomerPaymentMethod: NSObject {
    
    var _id : String!
    var _description : String!
    var type : String!
    var value : String!
    
    public class func fromJSON(json : NSDictionary) -> CustomerPaymentMethod {
        let customerPaymentMethod = CustomerPaymentMethod()
        
        if json["id"] != nil && !(json["id"]! is NSNull) {
            customerPaymentMethod._id = json["id"] as! String
        }

        if json["description"] != nil && !(json["description"]! is NSNull) {
            customerPaymentMethod._description = json["description"] as! String
        }
        
        if json["type"] != nil && !(json["type"]! is NSNull) {
            customerPaymentMethod.type = json["type"] as! String
        }
        
        if json["value"] != nil && !(json["value"]! is NSNull) {
            customerPaymentMethod.value = json["value"] as! String
        }
        
        return customerPaymentMethod
    }
    
    
    public func toJSON() -> JSON {
        let obj:[String:AnyObject] = [
            "_id": self._id,
            "_description": self._description == nil ? "" : self._description!,
            "type" : self.type,
            "value": self.value
        ]
        
        return JSON(obj)
    }
    
    public func toJSONString() -> String {
        return self.toJSON().toString()
    }

    
}
