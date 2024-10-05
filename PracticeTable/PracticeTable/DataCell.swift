//
//  DataCell.swift
//  PracticeTable
//
//  Created by admin on 04/10/24.
//

import UIKit

class DataCell: UITableViewCell {

    @IBOutlet weak var setLabel: UILabel!
    
    @IBOutlet weak var TableLabel: UILabel!
    
    @IBOutlet weak var punchlineLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
