//
//  WelcomeView.swift
//  LogginApp_MVP
//
//  Created by Diana Pava Avila on 18/03/24.
//
import UIKit
import Lottie

protocol WelcomeViewDelegate: AnyObject{
    func showLogin()
}

class WelcomeView: UIView {
    
    private lazy var animationView: LottieAnimationView = {
        let animationView = LottieAnimationView()
        animationView.animation = LottieAnimation.named("hi")
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.loopMode = .loop
        animationView.layer.cornerRadius = 10
        animationView.play()
        return animationView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 40)
        label.textColor = .systemPink
        label.textAlignment = .center
        label.text = "¡Welcome!"
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .systemPink
        label.textAlignment = .center
        label.text = "Join the adventure"
        return label
    }()
    
    private lazy var imageWelcome: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "globo")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Get Started", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 27
        button.backgroundColor = .systemPink
        button.addTarget(self, action: #selector(getStarted), for: .touchUpInside)
        return button
    }()
    
    weak var delegate: WelcomeViewDelegate?
    var leadingConstraint: NSLayoutConstraint!
    var topConstraint: NSLayoutConstraint!
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        setAnimationViewConstraints()
        setTitleLabelConstraints()
        setSubTitleLabelConstraints()
        setStartButtonlConstraints()
        
    }
    
    private func setAnimationViewConstraints(){
        addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            animationView.centerXAnchor.constraint(equalTo: centerXAnchor),
            animationView.heightAnchor.constraint(equalToConstant: 250),
            animationView.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    private func setTitleLabelConstraints() {
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: animationView.bottomAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setSubTitleLabelConstraints() {
        addSubview(subTitleLabel)
        NSLayoutConstraint.activate([
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            subTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            subTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            subTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setStartButtonlConstraints() {
        addSubview(startButton)
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -100),
            startButton.heightAnchor.constraint(equalToConstant: 54),
            startButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
//    
//    private func setImageWelcomeConstraints() {
//        addSubview(imageWelcome)
//        leadingConstraint = imageWelcome.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -50)
//       topConstraint = imageWelcome.topAnchor.constraint(equalTo: bottomAnchor, constant: 100)
//        NSLayoutConstraint.activate([
//            leadingConstraint,
//         topConstraint,
//            imageWelcome.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 80),
//            imageWelcome.widthAnchor.constraint(equalToConstant: 50),
//            imageWelcome.heightAnchor.constraint(equalToConstant: 100)
//        ])
//    }
    
    @objc private func getStarted() {
        delegate?.showLogin()
    }
    
    func animate() {
//        let width = frame.size.width
//        leadingConstraint.constant = width
//        topConstraint.isActive = false
//        topConstraint = imageWelcome.topAnchor.constraint(equalTo: topAnchor, constant: 0)
//        topConstraint.isActive = true
        startButton.alpha = 0.0
    
//        UIView.animate(withDuration: 9, delay: 10) {
//            self.layoutIfNeeded()
//        }
//        
//        UIView.animate(withDuration: 2, delay: 3, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .repeat) {
//            self.layoutIfNeeded()
//        }
        
        UIView.animate(withDuration: 2) {
            self.startButton.alpha = 1.0
        }
    }
}
