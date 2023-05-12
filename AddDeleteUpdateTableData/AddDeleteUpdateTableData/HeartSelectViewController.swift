//
//  HeartSelectViewController.swift
//  AddDeleteUpdateTableData
//
//  Created by NT 2 on 13/02/23.
//

import UIKit

class HeartSelectViewController: UIViewController {
    
    @IBOutlet var tableview: UITableView!
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
    "Rohit Sharma"]
//    "Jasprit Bumrah",
//    "Jofra Archer",
//    "Rashid Khan",
//    "Trent Boult",
//    "Mitchell Star"]
    
    
    var favouriteCricketer = [String]() //Dictionary
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.separatorStyle = .none
        
        self.tableview.allowsMultipleSelectionDuringEditing = true
    }
    
    
    func selectedRowData(){
//        favouriteCricketer.removeAll()
        if let selectedRow = tableview.indexPathsForSelectedRows{
    

            for item in selectedRow{
                
                favouriteCricketer.append(playersName[item.row])
            }
            //This code is enterd by Dharmesh
            print("List of selected players")
            for i in favouriteCricketer{
                    print(i)
            }
            //--------------------
        }
    }
    @IBAction func addSelectedData(_ sender: UIButton) {
        let favorite = self.storyboard?.instantiateViewController(identifier: "favouritehome") as! FavouritePlayersVC

        favorite.favouriteList = favouriteCricketer

        self.navigationController?.pushViewController(favorite, animated: true)
    }
    
}
extension HeartSelectViewController : UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        
//        let cell = tableview.cellForRow(at: indexPath)?.accessoryType = .checkmark
                //it is for check mark
        
        let cell = tableview.cellForRow(at: indexPath) as! HeartTableViewCell
        
        cell.heartImage.image = UIImage(named: "selectedheart")
        favouriteCricketer.append(playersName[indexPath.row])

            
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print(#function)

//        let cell = tableview.cellForRow(at: indexPath)?.accessoryType = .none                 //it is for check mark

        let cell = tableview.cellForRow(at: indexPath) as! HeartTableViewCell
        cell.heartImage.image = UIImage(named: "unselectedheart")
        
        if let index = favouriteCricketer.index(of: playersName[indexPath.row]) {
            print(favouriteCricketer.remove(at: index))
        }

        
    }
}
extension HeartSelectViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playersName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = playersName[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    
}
