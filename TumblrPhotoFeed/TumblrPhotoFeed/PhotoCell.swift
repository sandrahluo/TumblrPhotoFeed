//
//  PhotoCell.swift
//  TumblrPhotoFeed
//
//  Created by Sandra Luo on 1/31/18.
//  Copyright © 2018 Sandra Luo. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {

    
    @IBOutlet weak var photoView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
