

import Foundation



let dictionary1 =  ["no": 32, "data": ["id": 21, "name": "Daniyal", "account_id": 90]] as [String : AnyObject]
let dictionary2 =  ["no": 32, "data": ["id": 32, "name": "Daniyal", "account_id": 90]] as [String : AnyObject]
let dictionary3 =  ["no": 32, "data": ["id": 132, "name": "Daniyal", "account_id": 90]] as [String : AnyObject]
let dictionary4 =  ["no": 32, "data": ["id": 332, "name": "Daniyal", "account_id": 90]] as [String : AnyObject]
let dictionary5 =  ["no": 32, "data": ["id": 632, "name": "Daniyal", "account_id": 90]] as [String : AnyObject]
let dictionary6 =  ["no": 32, "data": ["id": 322, "name": "Daniyal", "account_id": 90]] as [String : AnyObject]
let dictionary7 =  ["no": 32, "data": ["id": 362, "name": "Daniyal", "account_id": 90]] as [String : AnyObject]
let dictionary8 =  ["no": 32, "data": ["id": 302, "name": "Daniyal", "account_id": 90]] as [String : AnyObject]
let dictionary9 =  ["no": 32, "data": ["id": 3212, "name": "Daniyal", "account_id": 90]] as [String : AnyObject]
let dictionary10 =  ["no": 32, "data": ["id": 3322, "name": "Daniyal", "account_id": 90]] as [String : AnyObject]

struct Data {
    var no:Int = 0
    var data:[String: AnyObject] = [:]
    init(no: Int, data: [String:AnyObject]) {
        self.no = no
        self.data = data
    }
}

