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
    
    //var ref : FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInButton(_ sender: UIButton) {
        let ref = FIRDatabase.database().reference()
        
        if let userId = idField.text {
            print(userId)
            
            ref.child("users").child(userId).observeSingleEvent(of: .value, with: {snapshot in
                if snapshot.exists() {
                    print("exist")
                    let snapValue = snapshot.value as? [String : String] // 값 가져오기
                    print (snapValue?["id"]! as Any)
//                    if let id = snapshot.value["id"] as? String{
//                        if id == idField.text {
//                            print("동일한 id가 있습니다")
//                        }
//
//                    }
//                    if snapshot.value["id"] as? String == idField.text {
//                        print("동일한 id가 있습니다")
//                    }
                    let alert = UIAlertController(title: "Login", message: "로그인 되었습니다.", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "메인 페이지로 이동", style: .default, handler: {
                        (alert: UIAlertAction!) in
                        //self.performSegueWithIdentifier("segueId", sender: self);
                        self.performSegue(withIdentifier: "segToMain", sender: self)
                        
                        //(action: UIAlertAction) -> Void in
                        //self.navigationController!.popViewController(animated: true)
                        //self.performSegue(withIdentifier: "segToMain", sender: nil)
                        //print("aa")
                    }))
                    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                    
                    self.present(alert, animated: true, completion: nil)
//                    
//                    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
//                        (action: UIAlertAction) -> Void in
//                        print("Cancel 버튼 클릭")
//                    }))
                }
                else {
                    let alert = UIAlertController(title: "Login Failed", message: "로그인이 실패되었습니다.\nID를 다시 확인해주세요.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
                        (action: UIAlertAction) -> Void in
                        print("OK 버튼 클릭")
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
            })
        }
    }
    
    @IBAction func kakaoLoginBtn(_ sender: UIButton) {
        let session = KOSession.shared()
        print(KOSession.version())
        print(session)
        if let s = session {
            if s.isOpen() {
                s.close()
            }
            
            s.open(completionHandler: {(error) in
                if error == nil {
                    print("No error")
                    
                    if s.isOpen() {
                        print("Success")
                    }
                    else {
                        print("Fail")
                    }
                }
                else {
                    print("Error login: \(error!)")
                }
            })
        }
        else {
            print("Something wrong")
        }
    }
    
}
                /*
                if lampOn {
                    let alert = UIAlertController(title: "알림", message: "램프가 끄시겠습니까?", preferredStyle: .alert)
                    
                    // handler 타입을 미리 알고 있기 때문에 정의 필요 없음, 기본으로 -> void로 되어 있는데 이럴 경우에는 생략 가능
                    alert.addAction(UIAlertAction(title: "네", style: .default, handler: {
                        (action) in
                        self.lampOn = false
                        self.lampImageView.image = UIImage(named: "lamp-off.png")
                    }
                        
                    ))
                    
                    alert.addAction(UIAlertAction(title: "아니오", style: .cancel, handler: nil))
                    
                    present(alert, animated: true, completion: nil)
                }
                
                override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                    // Get the new view controller using segue.destinationViewController.
                    // Pass the selected object to the new view controller.
                    if let editVC = segue.destination as? EditViewController { //EditViewController를 형변환 해서 destination에 넣어준다
                        //editVC.segueIdLabel.text = segue.identifier
                        editVC.segueId = segue.identifier!
                        editVC.message = messageTextField.text!
                        editVC.delegate = self
                    }
                }
                
                showAlert(title: "알림", message: "카메라를 사용할 수 없습니다.")
                */





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




