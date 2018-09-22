//
//  Meal.swift
//  FoodTracker
//
//  Created by Dean Chong San on 2018-09-22.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import UIKit

class Meal {
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //Optional initializer which returns a nil object if the initialization is done wrongly
    init?(name: String, photo: UIImage?, rating: Int){
        
        //Name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        //The rating must be between 0 and 5 inclusively
        guard (rating >= 0) && (rating <= 5) else{
            return nil
        }
        
        //Initialize stored properties
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
