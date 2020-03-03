//
//  UserCell.swift
//  CocoaPodsLab
//
//  Created by Christian Hurtado on 3/3/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class UserCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var profileView: UIImageView!
    
    public func configureCell(user: User) {
        print("\(user.name.title)\(user.name.title) \(user.name.first) \(user.name.last)")
        nameLabel.text = "\(user.name.title). \(user.name.first) \(user.name.last)"
        addressLabel.text = "\(user.location.street.number) \(user.location.street.name)\n\(user.location.city), \(user.location.state)\n\(user.location.postcode)"
        guard let imageURL = URL(string: user.picture.large) else { return }
        profileView.kf.setImage(with: imageURL)
    }
    
    
}
