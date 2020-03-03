//
//  ViewController.swift
//  CocoaPodsLab
//
//  Created by Christian Hurtado on 3/3/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import UIKit

class InitialVC: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var users = [User](){
    didSet {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
//        collectionView.register(UserCell.self, forCellWithReuseIdentifier: "UserCell")
         loadInfo()
    }
    
    func loadInfo(){
        APIClient.getUsers { (result) in
            switch result {
            case .failure(let error):
                print("error: \(error)")
            case .success(let users):
                self.users = users
                dump(users)
            }
        }
    }
    
    
}

extension InitialVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCell", for: indexPath) as? UserCell else{ 
            fatalError("could not downcast to UserCell")
        }
        let selUser = users[indexPath.row]
        cell.configureCell(user: selUser)
        cell.backgroundColor = .green
        return cell
    }
}

extension InitialVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxSize: CGSize = UIScreen.main.bounds.size
        let spacingBetweenItems: CGFloat = 11
        let numberOfItems: CGFloat = 3
        let totalSpacing: CGFloat = (2 * spacingBetweenItems) + (numberOfItems - 1) * spacingBetweenItems
        let itemWidth: CGFloat = (maxSize.width - totalSpacing) / numberOfItems
        let itemHeight: CGFloat = maxSize.height * 0.3 // 20% of height
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
