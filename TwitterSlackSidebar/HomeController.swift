//
//  ViewController.swift
//  TwitterSlackSidebar
//
//  Created by Frank Ferreira on 21/04/19.
//  Copyright © 2019 Frank Ferreira. All rights reserved.
//

import UIKit

class HomeController: UITableViewController {
    
    let menuController = MenuController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .red
        setupNavigationItems()
    }
    
    fileprivate let menuWidth: CGFloat = 300
    
    @objc func handleHide() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            // final position to animate our menuController object
            self.menuController.view.transform = .identity
        })
        //
        //        menuController.view.removeFromSuperview()
        //        menuController.removeFromParent()
    }
    
    @objc func handleOpen() {
        // initial position
        menuController.view.frame = CGRect(x: -menuWidth, y: 0, width: 300, height: self.view.frame.height)
        let mainWindows = UIApplication.shared.keyWindow
        mainWindows?.addSubview(menuController.view)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            // final position to animate our menuController object
            self.menuController.view.transform = CGAffineTransform(translationX: self.menuWidth, y: 0)
        })
        
        addChild(menuController)
    }
    
    fileprivate func setupNavigationItems() {
        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(handleOpen))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hide", style: .plain, target: self, action: #selector(handleHide))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cellId")
        cell.textLabel?.text = "Row \(indexPath.row)"
        
        return cell
    }
}

