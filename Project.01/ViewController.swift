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
    
    //var ref = FIRDatabase.database().reference()
    //let ref = FIRDatabase.database().reference()
    var ref : FIRDatabaseReference!
    //var ref: FIRDatabaseReference!
    
    //ref = FIRDatabase.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signUpButton(_ sender: UIButton) {
        ref = FIRDatabase.database().reference()
        self.ref.child("users").setValue(["id":idField.text, "pw":pwField.text])
    }

}

