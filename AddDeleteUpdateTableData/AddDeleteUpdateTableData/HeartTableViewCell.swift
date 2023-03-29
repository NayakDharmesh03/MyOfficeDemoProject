//
//  HeartTableViewCell.swift
//  AddDeleteUpdateTableData
//
//  Created by NT 2 on 13/02/23.
//

import UIKit

class HeartTableViewCell: UITableViewCell {

    @IBOutlet var heartImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
