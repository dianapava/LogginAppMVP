//
//  LogginView.swift
//  LogginApp_MVP
//
//  Created by Diana Pava Avila on 18/03/24.
//

import UIKit
import Lottie

class LogginView: UIView {
    
    private lazy var animationView: LottieAnimationView = {
        let animationView = LottieAnimationView()
        animationView.animation = LottieAnimation.named("animation")
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.loopMode = .loop
        animationView.play()
        return animationView
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Ingrese su email"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Ingrese su contraseña"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ingresar", for: .normal)
        button.backgroundColor = .systemGray
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        setEmailTextFieldConstraints()
        setPasswordTextFieldConstraints()
        setloginButtonConstraints()
    }
    
    private func setEmailTextFieldConstraints() {
        addSubview(emailTextField)
        NSLayoutConstraint.activate([
            emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        ])
    }
    
    private func setPasswordTextFieldConstraints() {
        addSubview(passwordTextField)
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        ])
    }
    
    private func setloginButtonConstraints() {
        addSubview(loginButton)
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            loginButton.heightAnchor.constraint(equalToConstant: 32),
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
