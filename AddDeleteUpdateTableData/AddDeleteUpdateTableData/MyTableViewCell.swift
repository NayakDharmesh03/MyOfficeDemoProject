//
//  MyTableViewCell.swift
//  AddDeleteUpdateTableData
//
//  Created by NT 2 on 10/02/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet var editbutton: UIButton!
    @IBOutlet var deleteButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
