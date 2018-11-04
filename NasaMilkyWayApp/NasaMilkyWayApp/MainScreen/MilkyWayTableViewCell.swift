//
//  MilkyWayTableViewCell.swift
//  NasaMilkyWayApp
//
//  Created by Emese Toth on 04/11/2018.
//  Copyright © 2018 Emese Toth. All rights reserved.
//

import UIKit

class MilkyWayTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var detailsLabel: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var milkyWayView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
