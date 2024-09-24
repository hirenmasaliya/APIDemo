//
//  TableViewCell.swift
//  APIDemo
//
//  Created by Hiren Masaliya on 24/09/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var txtSetup: UILabel!
    @IBOutlet weak var txtPunchLine: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
