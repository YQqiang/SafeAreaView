//
//  ViewController.swift
//  SafeArea
//
//  Created by oxape on 12/14/2018.
//  Copyright (c) 2018 oxape. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var contentView: ContentView!
    
    fileprivate lazy var tableView: UITableView = {
        let tableV = UITableView(frame: CGRect.zero, style: .plain)
        tableV.delegate = self
        tableV.dataSource = self
        tableV.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.self.description())
        return tableV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let superView = contentView.containerView
        superView.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: superView.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: superView.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.self.description())!
        cell.textLabel?.text = "row = \(indexPath.row)"
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

