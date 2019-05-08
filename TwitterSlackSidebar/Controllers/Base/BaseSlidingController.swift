//
//  BaseSlidingController.swift
//  TwitterSlackSidebar
//
//  Created by Frank Ferreira on 07/05/19.
//  Copyright © 2019 Frank Ferreira. All rights reserved.
//

import UIKit

class BaseSlidingController: UIViewController {

    var redViewLeadingConstraint: NSLayoutConstraint!
    fileprivate let menuWidth: CGFloat = 300
    
    let redView: UIView = {
       let v = UIView()
        v.backgroundColor = .red
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let blueView: UIView = {
        let v = UIView()
        v.backgroundColor = .blue
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
        
        setupViews()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(panGesture)
    }
    
    @objc func handlePan(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        var x = translation.x
        
        x = min(menuWidth, x)
        
        redViewLeadingConstraint.constant = x
    }
    
    fileprivate func setupViews() {
        view.addSubview(redView)
        view.addSubview(blueView)

        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: view.topAnchor),  redView.bottomAnchor.constraint(equalTo: view.bottomAnchor), redView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            blueView.topAnchor.constraint(equalTo: view.topAnchor),
            blueView.trailingAnchor.constraint(equalTo: redView.leadingAnchor),
            blueView.widthAnchor.constraint(equalToConstant: menuWidth),
            blueView.bottomAnchor.constraint(equalTo: redView.bottomAnchor)
            ])
        
        self.redViewLeadingConstraint = redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        redViewLeadingConstraint.isActive = true
    }
}
