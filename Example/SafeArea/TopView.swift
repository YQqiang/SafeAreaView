//
//  TopView.swift
//  SafeArea_Example
//
//  Created by sungrow on 2018/12/14.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import SafeArea

class TopView: SGSafeAreaView {
    
    fileprivate lazy var navBar: UIView = {
        let nav = UIView()
        nav.backgroundColor = UIColor.orange
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.textColor = UIColor.white
        lbl.text = "Title"
        nav.addSubview(lbl)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.topAnchor.constraint(equalTo: nav.topAnchor).isActive = true
        lbl.leftAnchor.constraint(equalTo: nav.leftAnchor).isActive = true
        lbl.rightAnchor.constraint(equalTo: nav.rightAnchor).isActive = true
        lbl.bottomAnchor.constraint(equalTo: nav.bottomAnchor).isActive = true
        return nav
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createV()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createV()
    }
    
}

extension TopView {
    fileprivate func createV() {
        
        backgroundColor = UIColor.orange
        
        containerView.addSubview(navBar)
        navBar.translatesAutoresizingMaskIntoConstraints = false
        navBar.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        navBar.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        navBar.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        navBar.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        navBar.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
}
