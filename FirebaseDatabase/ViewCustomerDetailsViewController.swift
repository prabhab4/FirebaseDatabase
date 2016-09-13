//
//  ViewCustomerDetailsViewController.swift
//  FirebaseDatabase
//
//  Created by Prabhab Shrestha on 08/09/2016.
//  Copyright © 2016 Prabhab Shrestha. All rights reserved.
//

import UIKit
import Firebase

struct postStruct {
    let customerName : String!
    let dateOfBirth : String!
    let phoneNo1 : String!
    let phoneNo2 : String!
    let email : String!
    let address : String!
}

class ViewCustomerDetailsViewController: UITableViewController {

//    var names = [String]()
    var names = [postStruct]()
    
    var customerName = String()
    var dateOfBirth = String()
    var phoneNo1 = String()
    var phoneNo2 = String()
    var email = String ()
    var address = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getFirebaseData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getFirebaseData(){
        let databaseRef = FIRDatabase.database().reference()
        databaseRef.child("Customers").queryOrderedByKey().observeEventType(.ChildAdded, withBlock: {
            snapshot in
            
            let customerName = snapshot.value!["name"] as! String
            let dateOfBirth = snapshot.value!["dateOfBirth"] as! String
            let phoneNo1 = snapshot.value!["phoneNo1"] as! String
            let phoneNo2 = snapshot.value!["phoneNo2"] as! String
            let email = snapshot.value!["email"] as! String
            let address = snapshot.value!["address"] as! String
            
            self.names.insert(postStruct(customerName: customerName, dateOfBirth: dateOfBirth, phoneNo1: phoneNo1, phoneNo2: phoneNo2, email: email, address: address) , atIndex: 0)
            
            self.tableView.reloadData()
        })
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell!
        
        cell.textLabel?.text = names[indexPath.row] as! String
        
        return cell!
    }
    
    //override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    //}
}
