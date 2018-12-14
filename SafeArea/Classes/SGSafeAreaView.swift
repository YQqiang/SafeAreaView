//
//  SGSafeAreaView.swift
//  operation4ios
//
//  Created by sungrow on 2018/12/14.
//  Copyright © 2018 阳光电源股份有限公司. All rights reserved.
//

import Foundation

public protocol SGSafeable {
    associatedtype Safeable
    var safe: Safeable { get }
    
    var top: NSLayoutYAxisAnchor { get }
    var bottom: NSLayoutYAxisAnchor { get }
    var left: NSLayoutXAxisAnchor { get }
    var right: NSLayoutXAxisAnchor { get }
}

extension SGSafeable where Safeable == UIView {
    
    private var view: UIView {
        return safe
    }
    
    public var top: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return view.safeAreaLayoutGuide.topAnchor
        }
        return view.topAnchor
    }
    
    public var bottom: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return view.safeAreaLayoutGuide.bottomAnchor
        }
        return view.bottomAnchor
    }
    
    public var left: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return view.safeAreaLayoutGuide.leftAnchor
        }
        return view.leftAnchor
    }
    
    public var right: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return view.safeAreaLayoutGuide.rightAnchor
        }
        return view.rightAnchor
    }
}

extension SGSafeable where Safeable == UIViewController {
    
    private var viewController: UIViewController {
        return safe
    }
    
    public var top: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return viewController.view.safe.top
        }
        return viewController.topLayoutGuide.bottomAnchor
    }
    
    public var bottom: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return viewController.view.safe.bottomAnchor
        }
        return viewController.bottomLayoutGuide.topAnchor
    }
    
    public var left: NSLayoutXAxisAnchor {
        return viewController.view.safe.left
    }
    
    public var right: NSLayoutXAxisAnchor {
        return viewController.view.safe.right
    }
}

extension UIView: SGSafeable {
    public typealias Safeable = UIView
    public var safe: Safeable {
        return self
    }
}

extension UIViewController: SGSafeable {
    public typealias Safeable = UIViewController
    public var safe: Safeable {
        return self
    }
}

open class SGSafeAreaView: UIView {
    public private(set) var containerView: UIView = {
        let v = UIView()
        return v;
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        createView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createView()
    }
    
    private func createView() {
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: safe.top).isActive = true
        containerView.leftAnchor.constraint(equalTo: safe.left).isActive = true
        containerView.rightAnchor.constraint(equalTo: safe.right).isActive = true
        containerView.bottomAnchor.constraint(equalTo: safe.bottom).isActive = true
    }
}
