//
//  LogginView.swift
//  LogginApp_MVP
//
//  Created by Diana Pava Avila on 18/03/24.
//

import UIKit
import Lottie

protocol LogginViewDelegate: AnyObject {
    func showLoading()
}

class LogginView: UIView {
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imageWallpaper: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "walpaperLogin")
        image.contentMode = .scaleAspectFill
        image.alpha = 0.4
        return image
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Ingrese su email"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Ingrese su contraseña"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ingresar", for: .normal)
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(getInto), for: .touchUpInside)
        return button
    }()
    
    weak var delegate: LogginViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        setContentViewConstraints()
        setImageWelcomeConstraints()
        setEmailTextFieldConstraints()
        setPasswordTextFieldConstraints()
        setloginButtonConstraints()
    }
    
    private func setContentViewConstraints() {
        addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setImageWelcomeConstraints() {
        contentView.addSubview(imageWallpaper)
        NSLayoutConstraint.activate([
            imageWallpaper.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageWallpaper.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageWallpaper.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageWallpaper.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setEmailTextFieldConstraints() {
        contentView.addSubview(emailTextField)
        NSLayoutConstraint.activate([
            emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        ])
    }
    
    private func setPasswordTextFieldConstraints() {
        contentView.addSubview(passwordTextField)
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        ])
    }
    
    private func setloginButtonConstraints() {
        contentView.addSubview(loginButton)
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 32),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            loginButton.widthAnchor.constraint(equalToConstant: 120),
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    @objc private func getInto(){
        delegate?.showLoading()
    }
}
