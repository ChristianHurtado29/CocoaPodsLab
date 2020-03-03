//
//  DetailView.swift
//  CocoaPodsLab
//
//  Created by Christian Hurtado on 3/3/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import UIKit
import SnapKit

class DetailView: UIView {
    
    public lazy var profileImageView:UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "mic")
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 60
        return iv
    }()
    
    public lazy var nameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 40)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    public lazy var dobLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 20)
        label.text = "dob label"
        return label
    }()
    
    public lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 20)
        label.text = "phone label"
        return label
    }()
    
    public lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 20)
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        setupNameLabel()
        setupImageView()
        setupDOB()
        setupPhone()
        setupAddress()
    }
    
    private func setupNameLabel(){
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(100)
            make.centerX.equalTo(center)
        }
    }
    
    private func setupImageView(){
        addSubview(profileImageView)
        profileImageView.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel).inset(60)
            make.centerX.equalTo(center)
        }
    }
    
    private func setupDOB(){
        addSubview(dobLabel)
        dobLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel).inset(200)
            make.centerX.equalTo(center)
        }
    }
    
    private func setupPhone(){
        addSubview(phoneLabel)
        phoneLabel.snp.makeConstraints { (make) in
            make.top.equalTo(dobLabel).inset(100)
            make.centerX.equalTo(center)
        }
    }
    
    private func setupAddress(){
        addSubview(addressLabel)
        addressLabel.snp.makeConstraints { (make) in
            make.top.equalTo(phoneLabel).inset(50)
            make.centerX.equalTo(center)
        }
    }
    
}
