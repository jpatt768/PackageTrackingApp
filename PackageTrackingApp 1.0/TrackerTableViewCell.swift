//
//  TrackerTableViewCell.swift
//  PackageTrackingApp 1.0
//
//  Created by Jayden Patterson on 2021/12/16.
//

import UIKit

class TrackerTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func update(with packageStatus: PackageStatus){
        nameLabel.text = packageStatus.name
        addressLabel.text = packageStatus.address
        statusLabel.text = packageStatus.status
    }
}
