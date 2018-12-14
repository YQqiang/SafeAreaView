//
//  BottomView.swift
//  SafeArea_Example
//
//  Created by sungrow on 2018/12/14.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import SafeArea

class BottomView: SGSafeAreaView {
    
    fileprivate lazy var btn: UIButton = {
        let b = UIButton(type: .custom)
        b.setTitle("Button", for: .normal)
        b.backgroundColor = UIColor.orange
        b.setTitleColor(UIColor.white, for: .normal)
        b.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        b.contentEdgeInsets = UIEdgeInsetsMake(8, 0, 8, 0)
        return b
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

extension BottomView {
    fileprivate func createV() {
        
        backgroundColor = UIColor.orange
        
        containerView.addSubview(btn)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        btn.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        btn.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        btn.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
    }
}
