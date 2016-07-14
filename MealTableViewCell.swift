//
//  MealTableViewCell.swift
//  FoodTracker2
//
//  Created by D Chad Leonard on 7/13/16.
//  Copyright © 2016 D Chad Leonard. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
  
  // MARK: Properties
  
  @IBOutlet weak var nameLabel: UILabel!
  
  @IBOutlet weak var photoImageView: UIImageView!
  
  @IBOutlet weak var ratingControl: RatingControl!
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
