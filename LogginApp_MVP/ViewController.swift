//
//  ViewController.swift
//  LogginApp_MVP
//
//  Created by Diana Pava Avila on 18/03/24.
//

import UIKit

class ViewController: UIViewController {

    
    private lazy var logginView: LogginView = {
        let view = LogginView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setViewConstraints()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    private func setViewConstraints() {
        view.addSubview(logginView)
        NSLayoutConstraint.activate([
            logginView.topAnchor.constraint(equalTo: view.topAnchor),
            logginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            logginView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            logginView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}


