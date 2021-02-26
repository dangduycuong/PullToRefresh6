//
//  LISTUSERSCell.swift
//  PullToRefresh6
//
//  Created by Dang Duy Cuong on 2/26/21.
//  Copyright © 2021 duycuong. All rights reserved.
//

import UIKit

class LISTUSERSCell: BaseTableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    var data = Datum()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillData() {
        if let firstName = data.firstName, let lastName = data.lastName {
            nameLabel.text = "\(firstName) \(lastName)"
        }
        emailLabel.text = data.email
        if let link = data.avatar {
            avatarImageView.dowloadFromServer(link: link)
        }
        
    }
}
