//
//  myStack.swift
//  FoodTracker
//
//  Created by Dean Chong San on 2018-08-25.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import Foundation

struct myStack<T> {
    var items = [T]()
    
    //Function push
    mutating func push(_ item: T){
        items.append(item)
    }
    
    mutating func pop () -> T{
    return items.removeLast()
    }
    
}
extension myStack {
    var topItem : T? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}
