//
//  ArtistTableViewCell.swift
//  LastFmPlayerApp
//
//  Created by Сергей on 01/10/2019.
//  Copyright © 2019 Effective. All rights reserved.
//

import UIKit

class ArtistTableViewCell: UITableViewCell {

    @IBOutlet weak var imageArtist: UIImageView!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
