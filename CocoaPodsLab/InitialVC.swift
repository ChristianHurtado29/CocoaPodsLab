//
//  ViewController.swift
//  CocoaPodsLab
//
//  Created by Christian Hurtado on 3/3/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import UIKit

class InitialVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }


}

extension InitialVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        let selUser = users[indexPath.row]
        
        return cell
    }
    
    
}

extension InitialVC: UITableViewDelegate{
    
}
