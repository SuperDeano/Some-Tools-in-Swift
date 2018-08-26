//
//  myQueue.swift
//  FoodTracker
//
//  Created by Dean Chong San on 2018-08-25.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import Foundation

struct myQueue <T> {
    var items = [T]()
    
    mutating func enqueue(_ item : T){
        items.append(item)
    }
    
    mutating func dequeue() -> T {
        return items.removeFirst()
    }
    
    mutating func isEmpty() -> Bool {
        return items.isEmpty
    }
    
    func count() -> Int {
        return items.count
    }
    
}
