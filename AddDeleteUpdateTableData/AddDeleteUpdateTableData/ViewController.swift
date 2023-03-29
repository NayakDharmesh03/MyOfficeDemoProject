//
//  ViewController.swift
//  AddDeleteUpdateTableData
//
//  Created by NT 2 on 10/02/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var studentsTableView: UITableView!
    var namrTf:UITextField?
    @IBOutlet var addStudent: UIBarButtonItem!
    var studentsName:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        studentsTableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func deleteStudents(_ sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: studentsTableView)
        guard let indexPath = studentsTableView.indexPathForRow(at: point) else{
            return
        }
        studentsName.remove(at: indexPath.row)
        studentsTableView.deleteRows(at: [indexPath], with: .left)
    }
    @IBAction func addStudents(_ sender: UIBarButtonItem) {
        studentsName.insert("New Students", at: 0)
        studentsTableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .top)
    }
    
    @IBAction func editStudents(_ sender: UIButton) {

        let point = sender.convert(CGPoint.zero, to: studentsTableView)
        guard let indexPath = studentsTableView.indexPathForRow(at: point) else{
            return
        }
        let selectedSRow = studentsName[indexPath.row]
        
        let alerBox = UIAlertController(title: "EditData", message: "Edit your data here.", preferredStyle: .alert)
        let update = UIAlertAction(title: "Update", style: .default) { (action) in
            let updatedName = self.namrTf?.text!
            self.studentsName[indexPath.row] = updatedName!
            DispatchQueue.main.async {
                self.studentsTableView.reloadData()
                print("Data has been updated")
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("Edit option cancel by user")
        }
        
        alerBox.addAction(update)
        alerBox.addAction(cancel)
        alerBox.addTextField { (textfield) in
            self.namrTf = textfield
            self.namrTf?.placeholder = "Edit name here"
            self.namrTf?.text = selectedSRow
        }
        self.present(alerBox, animated: true, completion: nil)
    }
    
    
}
extension ViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
}
extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return studentsName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.studentsTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        cell.textLabel?.text = studentsName[indexPath.row]
        return cell
    }
    
    
}
