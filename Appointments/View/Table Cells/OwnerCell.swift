//
//  ProfessorCell.swift
//  Appointments
//
//  Created by Aalim Mulji on 5/8/19.
//  Copyright © 2019 Aalim Mulji. All rights reserved.
//

import UIKit

class OwnerCell: UITableViewCell {

    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var ownerDesignationLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
