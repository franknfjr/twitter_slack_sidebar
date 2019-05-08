//
//  CustomMenuHeaderView.swift
//  TwitterSlackSidebar
//
//  Created by Frank Ferreira on 08/05/19.
//  Copyright © 2019 Frank Ferreira. All rights reserved.
//

import UIKit

class CustomMenuHeaderView: UIView {

    let nameLabel = UILabel()
    let usernameLable = UILabel()
    let statsLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        setupComponentProps()
        setupStackView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupStackView() {
        let arrangedSubviews = [UIView(), nameLabel, usernameLable, SpacerView(space: 16), statsLabel]
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.axis = .vertical
        stackView.spacing = 4
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
    }
    
    fileprivate func setupComponentProps() {
        nameLabel.text = "Frank Ferreira"
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        usernameLable.text = "@franknfjr"
        statsLabel.text = "1 Following 14M Followers"
    }
    
}
