//
//  ViewController.swift
//  FoodTracker2
//
//  Created by D Chad Leonard on 7/2/16.
//  Copyright © 2016 D Chad Leonard. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
  
  
  // MARK: Properties
  
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var photoImageView: UIImageView!
  @IBOutlet weak var ratingControl: RatingControl!
  @IBOutlet weak var saveButton: UIBarButtonItem!
  
  
  
  /* 
 
  This value is either passed my 'MealTableController' in
   'prerareForSegue(_:sender:)' or constructed as part of 
   adding a new meal.
 */
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    nameTextField.delegate = self
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  // MARK: UITextFieldDelegate
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    
    // Hide the keyboard
    textField.resignFirstResponder()
    
    return true
  }
  
  func textFieldDidEndEditing(textField: UITextField) {
    
    
  }
  
  
  // MARK: UIImagePickerControllDelegate
  func imagePickerControllerDidCancel(picker: UIImagePickerController) {
    
    // Dismiss the picker if the user canceled.
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
    
    // The info dictionary contains multiple representations of the image, and this uses the original.
    let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
    
    // Set photoImageView to display the selected image.
    photoImageView.image = selectedImage
    
    // Dismiss the picker
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  // MARK: Navigation
  // This method lets you configure a view controller before it's presented. 
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if saveButton === sender {
      let name = nameTextField.text ?? ""
      let photo = photoImageView.image
      let rating = ratingControl.rating
      
      // Set the meal to be passed to MealTableViewController after unwind segue.
      
      meal = Meal(name: name, photo: photo, rating: rating)
      
    }
  }
  
  //MARK: Actions
  
  @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
    
    // Hide the Keyboard.
    nameTextField.resignFirstResponder()
    
    // UIIMagePickerControll is a view controller that lets a user pick media from their photo library.
    let imagePickerController = UIImagePickerController()
    
    // Only allow photos to be picked not taken.
    imagePickerController.sourceType = .PhotoLibrary
    
    // Make sure ViewController is notified when the user picks an image.
    imagePickerController.delegate = self
    presentViewController(imagePickerController,animated: true,completion: nil)
  }
  
}














