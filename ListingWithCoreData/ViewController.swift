//
//  ViewController.swift
//  ListingWithCoreData
//
//  Created by Joy Mondal on 03/02/20.
//  Copyright © 2020 Techno-MAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var empArr : [Employee]?
    override func viewDidLoad() {
        super.viewDidLoad()
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addStuff))
        navigationItem.rightBarButtonItem = add

        
    }
    override func viewWillAppear(_ animated: Bool) {
        CoreDataManager.shared.fetchData(compltion: { (arr) in
            if let empArr = arr{
                self.empArr = empArr
                self.tableView.reloadData()
            }else{
                self.empArr = nil
            }
        })
    }
    @objc func addStuff(){
        let formVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FormViewController") as? FormViewController
        formVC?.isUpdate = false
        self.navigationController?.pushViewController(formVC!, animated: true)
    }
}

extension ViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let empArray = empArr{
            return empArray.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsCell") as? DetailsCell
        cell?.name.text = empArr![indexPath.row].name
        cell?.empID.text = empArr![indexPath.row].empID
        cell?.designation.text = empArr![indexPath.row].designation
        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let formVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FormViewController") as? FormViewController
        formVC?.EMPID = empArr![indexPath.row].empID
        formVC?.NAME = empArr![indexPath.row].name
        formVC?.DESIGNATION = empArr![indexPath.row].designation
        formVC?.isUpdate = true
        self.navigationController?.pushViewController(formVC!, animated: true)
        
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCell.EditingStyle.delete) {
            CoreDataManager.shared.deleteData(empID: empArr![indexPath.row].empID!) { (result) in
                print(result)
                empArr?.remove(at: indexPath.row)
                self.tableView.reloadData()
            }
        }
    }
 
}
