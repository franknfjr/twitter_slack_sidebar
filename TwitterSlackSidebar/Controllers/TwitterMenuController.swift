//
//  MenuController.swift
//  TwitterSlackSidebar
//
//  Created by Frank Ferreira on 21/04/19.
//  Copyright © 2019 Frank Ferreira. All rights reserved.
//

import UIKit

struct MenuItem {
    let icon: UIImage
    let title: String
}

extension TwitterMenuController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let slidingController = UIApplication.shared.keyWindow?.rootViewController as? BaseSlidingController
        slidingController?.didSelectMenuItem(indexPath: indexPath)
    }
}

class TwitterMenuController: UITableViewController {
    
    let menuItems = [
        MenuItem(icon: #imageLiteral(resourceName: "profile"), title: "Home"),
        MenuItem(icon: #imageLiteral(resourceName: "lists"), title: "Lists"),
        MenuItem(icon: #imageLiteral(resourceName: "bookmarks"), title: "Bookmarks"),
        MenuItem(icon: #imageLiteral(resourceName: "moments"), title: "Moments")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let customMenuHeaderView = CustomMenuHeaderView()
        return customMenuHeaderView
    }
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MenuItemCell(style: .default, reuseIdentifier: "cellId")
        
        let menuItem = menuItems[indexPath.row]
        cell.iconImageView.image = menuItem.icon
        cell.titleLabel.text = menuItem.title
        return cell
    }
}
