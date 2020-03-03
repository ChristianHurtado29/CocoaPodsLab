//
//  DetailVC.swift
//  CocoaPodsLab
//
//  Created by Christian Hurtado on 3/3/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    private let detailView = DetailView()
    
    override func loadView() {
        view = detailView
    }
    
    private var userDetails: User
    
    init(userDetail: User) {
        self.userDetails = userDetail
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(for: userDetails)
        view.backgroundColor = .white
    }
 
    private func updateUI(for user: User) {
        detailView.nameLabel.text = "\(user.name.title). \(user.name.first) \(user.name.last)"
        detailView.addressLabel.text = "\(user.location.street.number) \(user.location.street.name)\n\(user.location.city), \(user.location.state)\n\(user.location.postcode)"
        detailView.profileImageView.kf.setImage(with: URL(string: user.picture.large))
    }

}
