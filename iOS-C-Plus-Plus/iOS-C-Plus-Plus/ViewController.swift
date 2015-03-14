//
//  ViewController.swift
//  iOS-C-Plus-Plus
//
//  Created by Byrdann Fox on 3/12/15.
//  Copyright (c) 2015 lycan.io. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
    
    @IBOutlet weak var firstNameField: UITextField!
    
    @IBOutlet weak var lastNameField: UITextField!
    
    @IBAction func createBtn(sender: UIButton) {
    
        var managedContext: NSManagedObjectContext = appDelegate.managedObjectContext!
    
        var newPerson = NSEntityDescription.insertNewObjectForEntityForName("Person", inManagedObjectContext: managedContext) as NSManagedObject
     
        newPerson.setValue(firstNameField.text, forKey: "firstName")
        newPerson.setValue(lastNameField.text, forKey: "lastName")
        
        managedContext.save(nil)
        
    }
    
    @IBAction func readBtn(sender: UIButton) {
    
        var managedContext: NSManagedObjectContext = appDelegate.managedObjectContext!

        var request = NSFetchRequest(entityName: "Person")
        
        request.predicate = NSPredicate(format: "firstName = %@", firstNameField.text)
        
        var results = managedContext.executeFetchRequest(request, error: nil)
        
        for result in results! {
            
            lastNameField.text = result.valueForKey("lastName") as String
            
        }
    
    }
    
    @IBAction func updateBtn(sender: UIButton) {
    
        var managedContext: NSManagedObjectContext = appDelegate.managedObjectContext!
        
        var request = NSFetchRequest(entityName: "Person")
        
        request.predicate = NSPredicate(format: "firstName = %@", firstNameField.text)
        
        var results = managedContext.executeFetchRequest(request, error: nil)
        
        for result in results! {
            
            result.setValue(lastNameField.text, forKey: "lastName")
        
        }
        
        managedContext.save(nil)
    
    }
    
    @IBAction func deleteBtn(sender: UIButton) {
    
        var managedContext: NSManagedObjectContext = appDelegate.managedObjectContext!
        
        var request = NSFetchRequest(entityName: "Person")
        
        request.returnsObjectsAsFaults = false
        
        request.predicate = NSPredicate(format: "firstName = %@", firstNameField.text)
        
        var results = managedContext.executeFetchRequest(request, error: nil)
        
        // ...
        println(results)
        
        for result in results! {
            
            managedContext.deleteObject(result as NSManagedObject)
            
        }
        
        managedContext.save(nil)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}