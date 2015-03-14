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
    
        
    
    }
    
    @IBAction func updateBtn(sender: UIButton) {
    
        
    
    }
    
    @IBAction func deleteBtn(sender: UIButton) {
    
        
    
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