//
//  SubjectCell.swift
//  Messages
//
//  Created by Rafael Moura on 26/09/16.
//  Copyright © 2016 Rafael Moura. All rights reserved.
//

import UIKit

class SubjectCell: UITableViewCell {

    @IBOutlet weak var messageDateLabel: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
