//
//  Meal.swift
//  FoodTracker2
//
//  Created by D Chad Leonard on 7/12/16.
//  Copyright © 2016 D Chad Leonard. All rights reserved.
//

import UIKit

class Meal {
  
  //MARK: Properties
  
  var name: String
  var photo: UIImage?
  var rating: Int
  
  //MARK: Initialize
  
  init?(name: String, photo: UIImage?, rating: Int){
    
    self.name = name
    self.photo = photo
    self.rating = rating
    
    // Initialization should fail if there is no name or if the rating is negative.
    
    if name.isEmpty || rating < 0 {
      return nil
    }
  }
}











