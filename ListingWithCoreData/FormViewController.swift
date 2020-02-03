//
//  FormViewController.swift
//  ListingWithCoreData
//
//  Created by Joy Mondal on 03/02/20.
//  Copyright © 2020 Techno-MAC. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {

    @IBOutlet weak var empIDTF: UITextField!
     @IBOutlet weak var nameTF: UITextField!
     @IBOutlet weak var designationTF: UITextField!
     @IBOutlet weak var submitBtn: UIButton!
    var isUpdate : Bool?
    var NAME : String?
    var EMPID : String?
    var DESIGNATION : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if !isUpdate!{
            submitBtn.setTitle("Submit", for: .normal)
            empIDTF.isUserInteractionEnabled = true
            empIDTF.backgroundColor = .systemBackground
            
            
        }else{
            submitBtn.setTitle("Update", for: .normal)
            empIDTF.isUserInteractionEnabled = false
            empIDTF.backgroundColor = .gray

            empIDTF.text! = EMPID!
            nameTF.text! = NAME!
            designationTF.text! = DESIGNATION!
            
        }
        // Do any additional setup after loading the view.
    }
 
    @IBAction func submitDataAction(_ sender: Any) {
        if !isUpdate!{
        if empIDTF.text?.count != 0 || nameTF.text?.count != 0 || designationTF.text?.count != 0{
            CoreDataManager.shared.saveData(empID: empIDTF.text!, name: nameTF.text!, designation: designationTF.text!, completion: { (result) in
                if result{
                   print("Successfully Saved!!!")
                }else{
                    print("Something Error")
                }
            })
        }
        }else{
            if  nameTF.text?.count != 0 || designationTF.text?.count != 0{
                CoreDataManager.shared.updateData(empId: EMPID!, designation: designationTF.text!, name: nameTF.text!)
            }
        }
    }
}
