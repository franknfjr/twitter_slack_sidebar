//
//  ChatroomsMenuController.swift
//  TwitterSlackSidebar
//
//  Created by Frank Ferreira on 09/05/19.
//  Copyright © 2019 Frank Ferreira. All rights reserved.
//

import UIKit

class SlackMenuController: UITableViewController {
    
    let chatroomsGroups = [
        ["general", "introductions"],
        ["jobs"],
        ["Frank Ferreira", "Steve Rogers", "Iron Man", "Thanos"],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .purple
        tableView.separatorStyle = .none
        
        tableView.backgroundColor = #colorLiteral(red: 0.3118255138, green: 0.2191755474, blue: 0.2989195585, alpha: 1)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "UNREADS" : section == 1 ? "CHANNELS" : "DIRECT MESSAGES"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let text = chatroomsGroups[indexPath.section][indexPath.row]
        cell.textLabel?.text = text
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatroomsGroups[section].count
    }
}
