//
//  ListsController.swift
//  TwitterSlackSidebar
//
//  Created by Frank Ferreira on 08/05/19.
//  Copyright © 2019 Frank Ferreira. All rights reserved.
//

import UIKit

class ListsController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Lists"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.backgroundColor = .white
        let label = UILabel()
        label.text = "Lists"
        label.font = UIFont.boldSystemFont(ofSize: 64)
        label.frame = view.frame
        label.textAlignment = .center
        
        view.addSubview(label)
    }
}
