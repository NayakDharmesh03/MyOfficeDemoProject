//
//  FavouritePlayersVC.swift
//  AddDeleteUpdateTableData
//
//  Created by NT 2 on 13/02/23.
//

import UIKit

class FavouritePlayersVC: UIViewController {

    @IBOutlet var tableview2: UITableView!
    var favouriteList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
  

}
extension FavouritePlayersVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouriteList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableview2.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
    
        cell.textLabel?.text = favouriteList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            favouriteList.remove(at: indexPath.row)
            tableview2.deleteRows(at: [indexPath], with: .middle)
            tableview2.reloadData()
        }
    }
    
}


