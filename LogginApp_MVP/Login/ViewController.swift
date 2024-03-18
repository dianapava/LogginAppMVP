//
//  ViewController.swift
//  LogginApp_MVP
//
//  Created by Diana Pava Avila on 18/03/24.
//

import UIKit

class ViewController: UIViewController {

    
    private lazy var welcomeView: WelcomeView = {
        let view = WelcomeView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setViewConstraints()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        welcomeView.animate()
    }
    
    private func setViewConstraints() {
        view.addSubview(welcomeView)
        NSLayoutConstraint.activate([
            welcomeView.topAnchor.constraint(equalTo: view.topAnchor),
            welcomeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            welcomeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            welcomeView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ViewController: WelcomeViewDelegate {
    func showLogin() {
        let viewController = LogginUserViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}


