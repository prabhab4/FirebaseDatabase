//
//  AddCustomerViewController.swift
//  FirebaseDatabase
//
//  Created by Prabhab Shrestha on 08/09/2016.
//  Copyright © 2016 Prabhab Shrestha. All rights reserved.
//

import UIKit
import Firebase

class AddCustomerViewController: UIViewController {

    let databaseRef = FIRDatabase.database().reference()
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var dateOfBirthField: UITextField!
    @IBOutlet weak var phoneNoField: UITextField!
    @IBOutlet weak var phoneNo2Field: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func post() {
        
        let toPost : [String : AnyObject] = ["name": nameField.text!,
                                             "dateOfBirth": dateOfBirthField.text!,
                                             "phoneNo1": phoneNoField.text!,
                                             "phoneNo2": phoneNo2Field.text!,
                                             "email": emailField.text!,
                                             "address": addressField.text! ]
        
        //If all fields are empty = Do not add
        /**  Creates unique ID and adds Data to Firebase Database. Table name: "Customers"  **/
        databaseRef.child("Customers").childByAutoId().setValue(toPost)
        
    }
    
    @IBAction func addDetailsButton(sender: AnyObject) {
        post()
    }
    
    @IBAction func clearDetailsButton(sender: AnyObject) {
        nameField.text = ""
        dateOfBirthField.text = ""
        phoneNoField.text = ""
        phoneNo2Field.text = ""
        emailField.text = ""
        addressField.text = ""
    }
    
}
