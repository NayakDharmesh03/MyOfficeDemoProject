//
//  MultipleSelectionTableViewView.swift
//  AddDeleteUpdateTableData
//
//  Created by NT 2 on 13/02/23.
//

import UIKit

class MultipleSelectionTableViewView: UIViewController {

    @IBOutlet var myTableView: UITableView!
    var playersName =
    [
    "Sachin Tendulkar",
    "Virat Kohli",
    "Steve Smith",
    "Kane Williamson",
    "AB de Villiers",
    "Chris Gayle",
    "Ben Stokes",
    "Babar Azam",
    "David Warner",
    "Rohit Sharma",
    "Jasprit Bumrah",
    "Jofra Archer",
    "Rashid Khan",
    "Trent Boult",
    "Mitchell Star"]
    
    var selectedPlayers = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.myTableView.isEditing = true
        self.myTableView.allowsMultipleSelectionDuringEditing = true
    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        
        //choose selected data using button
        selectedPlayers.removeAll()
        if let selectedRow = myTableView.indexPathsForSelectedRows{
            for indexpath in selectedRow{
                selectedPlayers.append(playersName[indexpath.row])
            }
            print("You have Selected player")
            for item in selectedPlayers{
                print(item)
            }
        }
    }
    
//    @IBAction func selectDeseletData(_ sender: UIButton) {
//        self.selectedPlayers.removeAll()
//        if sender.isSelected{
//            for row in 0..<playersName.count{
//                self.myTableView.selectRow(at: IndexPath(row: row, section: 0), animated: false, scrollPosition: .none)
//            }
//            sender.isSelected = false
//            sender.setImage(UIImage(named: "check-1"), for: .normal)
//
//        }else{
//            for row in 0..<playersName.count{
//                self.myTableView.selectRow(at: IndexPath(row: row, section: 0), animated: false, scrollPosition: .none)
//            }
//            sender.isSelected = true
//            sender.setImage(UIImage(named:"checkmark.circle.fill"), for: .normal)
//            self.selectedPlayers.removeAll()
//            selectedPlayers = playersName
//        }
//    }
    
}
extension MultipleSelectionTableViewView {
    
    //choose selected data without button
    func selectAndDeselect(tableview:UITableView,indexpath:IndexPath){
        selectedPlayers.removeAll()
        if let selectedRow = myTableView.indexPathsForSelectedRows{
            for indexpath in selectedRow{
                selectedPlayers.append(playersName[indexpath.row])
            }
            print("You have Selected player")
            for item in selectedPlayers{
                print(item)
            }
        }
    }
}
extension MultipleSelectionTableViewView : UITableViewDelegate{
    
    //selected row in green
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectAndDeselect(tableview: myTableView, indexpath: indexPath)
        print("Select...")
//        let selectedCell:UITableViewCell = myTableView.cellForRow(at: indexPath)!
//        selectedCell.contentView.backgroundColor = UIColor.green

    }

    //deSelect row and ungreen
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        selectAndDeselect(tableview: myTableView, indexpath: indexPath)
        print("Deselect...")

//
//            myTableView.deselectRow(at: indexPath, animated: true)
//            let selectedCell:UITableViewCell = myTableView.cellForRow(at: indexPath)!
//            selectedCell.contentView.backgroundColor = UIColor.white
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            playersName.remove(at: indexPath.row)
            myTableView.deleteRows(at: [indexPath], with: .automatic)
            myTableView.reloadData()
        }
    }
}
extension MultipleSelectionTableViewView : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playersName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.myTableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel?.text = playersName[indexPath.row]
        return cell
    }
    
    
}
