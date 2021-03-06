//
//  MealTableViewController.swift
//  FoodTracker2
//
//  Created by D Chad Leonard on 7/13/16.
//  Copyright © 2016 D Chad Leonard. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
  
  // MARK: Properties
  
  var meals = [Meal]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Load the sample data
    loadSampleMeals()
  }
  func loadSampleMeals() {
    
    let photo1 = UIImage(named: "photo1")
    let meal1 = Meal(name: "Caprese Salad", photo: photo1, rating: 4)!
    
    let photo2 = UIImage(named: "photo2")
    let meal2 = Meal(name: "Chicken and Potatoes", photo: photo2, rating: 3)!
    
    let photo3 = UIImage(named: "photo3")
    let meal3 = Meal(name: "Pasta with Meatballs", photo: photo3, rating: 5)!
    
    meals += [meal1, meal2, meal3]
    
  }
  
  
  // MARK: - Table view data source
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return meals.count
  }
  
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cellIdentifier = "MealTableViewCell"
    
    let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MealTableViewCell
    
    let meal = meals[indexPath.row]
    
    cell.nameLabel.text = meal.name
    cell.photoImageView.image = meal.photo
    cell.ratingControl.rating = meal.rating
    
    return cell
    
  }
  
  @IBAction func unwindToMealList(sender: UIStoryboardSegue){
    if let sourceViewController = sender.sourceViewController as?
      MealViewController, meal = sourceViewController.meal {
      
      // Add a new meal
      let newIndexPath = NSIndexPath(forRow: meals.count, inSection: 0)
      meals.append(meal)
      tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
    }
  }
  
  
  /*
   // Override to support conditional editing of the table view.
   override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
   // Return false if you do not want the specified item to be editable.
   return true
   }
   */
  
  /*
   // Override to support editing the table view.
   override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
   if editingStyle == .Delete {
   // Delete the row from the data source
   tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
   } else if editingStyle == .Insert {
   // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
   }
   }
   */
  
  /*
   // Override to support rearranging the table view.
   override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
   
   }
   */
  
  /*
   // Override to support conditional rearranging of the table view.
   override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
   // Return false if you do not want the item to be re-orderable.
   return true
   }
   */
  
  
   // MARK: - Navigation
   
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowDetail"{
      let mealDetailViewController = segue.destinationViewController as! MealViewController
      
      // Get the cell that generated this segue.
      if let selectedMealCell = sender as? MealTableViewController {
        let indexPath = tableView.indexPathForCell(selectedMealCell)!
        let selectedMeal = meals[indexPath.row]
        mealDetailViewController.meal = selectedMeal
      }
    }
      
    else if segue.identifier == "AddItem" {
      print("Adding new meal")
      
      
    }
  }
}


















