//
//  CyprtoTableViewCell.swift
//  task
//
//  Created by Mac on 16/11/23.
//

import UIKit

class CyprtoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var logoImg: UIImageView!
    
    @IBOutlet weak var logotitle: UILabel!
    
    @IBOutlet weak var progressGraph: UIImageView!
    @IBOutlet weak var logosubTitleLbl: UILabel!
    
    
    @IBOutlet weak var pointerPercentageLbl: UILabel!
    @IBOutlet weak var pointerValue: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
