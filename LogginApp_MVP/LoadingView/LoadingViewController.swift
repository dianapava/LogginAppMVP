//
//  LoadingViewController.swift
//  LogginApp_MVP
//
//  Created by Diana Pava Avila on 18/03/24.
//

import UIKit
import Lottie

class LoadingViewController: UIViewController {
    
    private lazy var animationView: LottieAnimationView = {
        let animationView = LottieAnimationView()
        animationView.animation = LottieAnimation.named("loading")
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.loopMode = .loop
        animationView.play()
        return animationView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        setAnimationViewConstraints()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.dismiss(animated: false)
        }
    }
    
    private func setAnimationViewConstraints(){
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.heightAnchor.constraint(equalToConstant: 200),
        
        ])
    }
}
