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
    var leading: NSLayoutXAxisAnchor { get }
    var trailing: NSLayoutXAxisAnchor { get }
    var width: NSLayoutDimension { get }
    var height: NSLayoutDimension { get }
    var centerX: NSLayoutXAxisAnchor { get }
    var centerY: NSLayoutYAxisAnchor { get }
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
    
    public var leading: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return view.safeAreaLayoutGuide.leadingAnchor
        }
        return view.leadingAnchor
    }
    
    public var trailing: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return view.safeAreaLayoutGuide.trailingAnchor
        }
        return view.trailingAnchor
    }
    
    public var width: NSLayoutDimension {
        if #available(iOS 11.0, *) {
            return view.safeAreaLayoutGuide.widthAnchor
        }
        return view.widthAnchor
    }
    
    public var height: NSLayoutDimension {
        if #available(iOS 11.0, *) {
            return view.safeAreaLayoutGuide.heightAnchor
        }
        return view.heightAnchor
    }
    
    public var centerX: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return view.safeAreaLayoutGuide.centerXAnchor
        }
        return view.centerXAnchor
    }
    
    public var centerY: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return view.safeAreaLayoutGuide.centerYAnchor
        }
        return view.centerYAnchor
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
    
    public var leading: NSLayoutXAxisAnchor {
        return viewController.view.safe.leading
    }
    
    public var trailing: NSLayoutXAxisAnchor {
        return viewController.view.safe.trailing
    }
    
    public var width: NSLayoutDimension {
        return viewController.view.safe.width
    }
    
    public var height: NSLayoutDimension {
        return viewController.view.safe.height
    }
    
    public var centerX: NSLayoutXAxisAnchor {
        return viewController.view.safe.centerX
    }
    
    public var centerY: NSLayoutYAxisAnchor {
        return viewController.view.safe.centerY
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

@objcMembers open class SGSafeAreaView: UIView {
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
