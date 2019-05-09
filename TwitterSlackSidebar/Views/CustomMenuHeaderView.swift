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
    let profileImageView = ProfileImageView()
    
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
        let rightSpacerView = UIView()
        let arrangedSubviews = [
            UIStackView(arrangedSubviews: [profileImageView, rightSpacerView]),
            nameLabel,
            usernameLable,
            SpacerView(space: 16),
            statsLabel
        ]
        
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
        profileImageView.image =  #imageLiteral(resourceName: "girl_profile").withRenderingMode(.alwaysOriginal)
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.layer.cornerRadius = 48 / 2
        profileImageView.clipsToBounds = true
        profileImageView.backgroundColor = .red
        
        setupStatsAttributedText()
    }
    
    fileprivate func setupStatsAttributedText() {
        statsLabel.font = UIFont.systemFont(ofSize: 14)
        let attributedText = NSMutableAttributedString(string: "1 ", attributes: [.font: UIFont.systemFont(ofSize: 18, weight: .medium)])
        attributedText.append(NSAttributedString(string: "Following ", attributes: [.foregroundColor: UIColor.black]))
        attributedText.append(NSAttributedString(string: "14M ", attributes: [.font: UIFont.systemFont(ofSize: 18, weight: .medium)]))
        attributedText.append(NSAttributedString(string: "Followers", attributes: [.foregroundColor: UIColor.black]))
        
        statsLabel.attributedText = attributedText
    }
    
}
