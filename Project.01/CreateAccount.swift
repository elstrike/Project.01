//
//  CreateAccount.swift
//  Project.01
//
//  Created by Seong-ji Cho on 2017. 6. 10..
//  Copyright © 2017년 Seong-ji Cho. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CreateAccount: UIViewController {
    @IBOutlet weak var caIdField: UITextField!
    @IBOutlet weak var caPwField: UITextField!
    @IBOutlet weak var caPwConfirmField: UITextField!
    @IBOutlet weak var caNameField: UITextField!
    @IBOutlet weak var caMobileField: UITextField!
    @IBOutlet weak var caEmailField: UITextField!
    
    var ref : FIRDatabaseReference!
    
    @IBAction func signUpButton(_ sender: UIButton) {
        ref = FIRDatabase.database().reference()
        
        if let userId = caIdField.text {
            print(userId)
            
            ref.child("users").child(userId).observeSingleEvent(of: .value, with: { snapshot in
                if !snapshot.exists() {
                    if self.caPwField.text != self.caPwConfirmField.text {
                        print("비밀번호가 동일하지 않습니다. 다시 확인해주세요.")
                    }
                    else {
                        self.ref.child("users").child(userId).setValue([
                            "id":self.caIdField.text,
                            "pw":self.caPwField.text,
                            "Name":self.caNameField.text,
                            "Mobile":self.caMobileField.text,
                            "Email":self.caEmailField.text
                            ])
                    }
                }
                else {
                    print(snapshot)
                    if let firebaseDic = snapshot.value as? [String: AnyObject] {
                        print(firebaseDic)
                        let dbId = firebaseDic["id"]
                        if dbId as! String == userId {
                            print("true")
                        }
                    }
                }
            })
        }
    }
}
