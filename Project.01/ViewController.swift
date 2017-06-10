//
//  ViewController.swift
//  Project.01
//
//  Created by Seong-ji Cho on 2017. 5. 28..
//  Copyright © 2017년 Seong-ji Cho. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var pwField: UITextField!
    
    var ref : FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}




/*
 ref.runTransactionBlock({ (currentData: FIRMutableData) -> FIRTransactionResult in
 if var post = currentData.value as? [String : AnyObject], let uid = FIRAuth.auth()?.currentUser?.uid {
 var stars : Dictionary<String, Bool>
 stars = post["stars"] as? [String : Bool] ?? [:]
 var starCount = post["starCount"] as? Int ?? 0
 if let _ = stars[uid] {
 // Unstar the post and remove self from stars
 starCount -= 1
 stars.removeValueForKey(uid)
 } else {
 // Star the post and add self to stars
 starCount += 1
 stars[uid] = true
 }
 post["starCount"] = starCount
 post["stars"] = stars
 
 // Set value and report transaction success
 currentData.value = post
 
 return FIRTransactionResult.successWithValue(currentData)
 }
 return FIRTransactionResult.successWithValue(currentData)
 }) { (error, committed, snapshot) in
 if let error = error {
 print(error.localizedDescription)
 }
 }
 
 
 if var post = currentData.value as? [String : AnyObject], let uid = FIRAuth.auth()?.currentUser?.uid {
 var stars : Dictionary<String, Bool>
 stars = post["stars"] as? [String : Bool] ?? [:]
 var starCount = post["starCount"] as? Int ?? 0
 if let _ = stars[uid] {
 
 
 let userID = FIRAuth.auth()?.currentUser?.uid
 ref.child("users").child(userID!).observeSingleEventOfType(.Value, withBlock: { (snapshot) in
 // Get user value
 let username = snapshot.value!["username"] as! String
 let user = User.init(username: username)
 
 // ...
 }) { (error) in
 print(error.localizedDescription)
 }
 
 
 self.ref.child("users/(user.uid)/username").setValue(username)
 
 
 
 let key = ref.child("posts").childByAutoId().key
 let post = ["uid": userID,
 "author": username,
 "title": title,
 "body": body]
 let childUpdates = ["/posts/\(key)": post,
 "/user-posts/\(userID)/\(key)/": post]
 ref.updateChildValues(childUpdates)
 
 */


//            ref.runTransactionBlock({ (currentData: FIRMutableData) -> FIRTransactionResult in
//                if let post = currentData.value as? [String : AnyObject] {
//                    print(post)
//
//                }
//                return FIRTransactionResult.success(withValue: currentData)
//            })

//if ref.child("users").child(userId!).obssingo
//self.ref.child("users").child(userId).setValue(["id":idField.text, "pw":pwField.text])

//            let userID = FIRAuth.auth()?.currentUser?.uid
//            ref.child("users").child(userID!).observeSingleEventOfType(.Value, withBlock: { (snapshot) in
//                // Get user value
//                let username = snapshot.value!["username"] as! String
//                let user = User.init(username: username)
//
//                // ...
//            }) { (error) in
//                print(error.localizedDescription)
//            }
//let uid = Auth.auth().currentUser?.uid
//let userId = name.text!



//
//            self.ref.child("users").child(userId).observeSingleEvent(of: .value, with: { (snapshot) in
//                // Get user value
//                //if
//                let firebaseDic = [String: String]() // unwrap it since its an optional
//
//                let userIdFromDB = firebaseDic["\(userId)/id"] as? String
//                let userIdFromDB2 = firebaseDic["\(userId)"] as? String
//                let userIdFromDB3 = firebaseDic["id"] as? String
//                //print("aaa : \(snapshot.value as! String)")
//
//                print("\(userIdFromDB)")
//                print("\(userIdFromDB2)")
//                print("\(userIdFromDB3)")
//
//                print(snapshot.value)
//
//
//
//
//
////                if let ppp =  snapshot.value(forKey: "id") as? String {
////                    print(ppp)
////                }
//
////                self.ref.observe(FIRDataEventType.value, with: {(snapshot) in
////                    var userIdFromDB4 = snapshot.children
////                })
//
////                if let addr = subject["subject"] as? String {
////                    print(addr)
////                }
//
//                //let type = (self.data[indexPath.row] as? [String : String])?["Type"]
//                //print(type)
////                 print(snapshot.value(forKey: "id") ?? "bb")
//
//                if snapshot.exists()
//                {
//
//                    if userIdFromDB == userId {
//                        print("OLD ID : " + userIdFromDB!)
//                    }
//                    else {
//                        self.ref.child("users").child(userId).setValue(["id":self.idField.text, "pw":self.pwField.text])
//                        print("NEW ID : " + userId)
//                    }
//                }
//                else
//                {
//                    print("Error : \(snapshot.value as! String)")
//                }

/*
 let value = snapshot.value["users"] as? [String: AnyObject]
 print(userId)
 print(value)
 if value == userId {
 print("OLD ID : " + value!)
 }
 else {
 self.ref.child("users").child(userId).setValue(["id":self.idField.text, "pw":self.pwField.text])
 print("NEW ID : " + userId)
 }
 */
//            })


//let userIdExist = ref.child("users").child(userId).queryEqual(toValue: userId)
//        let userIdExist = ref.child("users").child(userId).snapshot.v,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                alue
//
//        if userIdExist as String == userId as String {
//            print(userId)
//        }




