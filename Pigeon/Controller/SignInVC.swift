//
//  SignInVC.swift
//  Pigeon
//
//  Created by Nasim Ahmed on 04.01.17.
//  Copyright © 2017 Nasim Ahmed. All rights reserved.
//

import UIKit
import Firebase

class SignInVC: UIViewController {
    
    var messagesController: MessagesController?
    
    let titleLabel: UILabel = {
        let tl = UILabel()
        tl.text = "pi"
        tl.textColor = #colorLiteral(red: 0.568627451, green: 0.6196078431, blue: 0.768627451, alpha: 1)
        tl.font = UIFont(name: "Poppins-Bold", size: 72)
        tl.textAlignment = .center
        tl.adjustsFontSizeToFitWidth = true
        return tl
    }()
    
    let emailBack: UIView = {
        let iv = UIView()
        iv.backgroundColor = #colorLiteral(red: 0.9996390939, green: 1, blue: 0.9997561574, alpha: 1)
        iv.layer.cornerRadius = 22
        iv.layer.masksToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.addShadow()
        return iv
    }()
    
    let passwordBack: UIView = {
        let iv = UIView()
        iv.backgroundColor = #colorLiteral(red: 0.9996390939, green: 1, blue: 0.9997561574, alpha: 1)
        iv.layer.cornerRadius = 22
        iv.layer.masksToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.addShadow()
        return iv
    }()
    
    let getStartedButton: UIButton = {
        let lb = UIButton(type: .system)
        lb.setImage(UIImage(named: "getstarted_btn")?.withRenderingMode(.alwaysOriginal), for: .normal)
        lb.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        lb.addShadow()
        return lb
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let emailImageView: UIImageView = {
        let uploadImageView = UIImageView()
        uploadImageView.image = UIImage(named: "email")
        uploadImageView.translatesAutoresizingMaskIntoConstraints = false
        return uploadImageView
    }()
    
    let passwordImageView: UIImageView = {
        let uploadImageView = UIImageView()
        uploadImageView.image = UIImage(named: "passwordIcon")
        uploadImageView.translatesAutoresizingMaskIntoConstraints = false
        return uploadImageView
    }()
    
    let createAccountButton: UIButton = {
        let lb = UIButton(type: .system)
        lb.setTitle("Create account", for: .normal)
        lb.setTitleColor(#colorLiteral(red: 0.568627451, green: 0.6196078431, blue: 0.768627451, alpha: 1), for: .normal)
        lb.titleLabel?.font = UIFont(name: "Muli-SemiBold", size: 14)
        lb.addTarget(self, action: #selector(handleCreateAccount), for: .touchUpInside)
        return lb
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.9996390939, green: 1, blue: 0.9997561574, alpha: 1)
        setupViews()
        
        UIFont.familyNames.forEach({ familyName in
            let fontNames = UIFont.fontNames(forFamilyName: familyName)
            print(familyName, fontNames)
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }

    
    func setupViews(){
        view.addSubview(titleLabel)
        
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 50, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 70, height: 100)
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [emailBack, passwordBack])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 56
        
        view.addSubview(stackView)
        stackView.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 69, paddingLeft: 63, paddingBottom: 0, paddingRight: 63, width: 0, height: 150)
        
        emailBack.addSubview(emailImageView)
        emailImageView.anchor(top: nil, left: emailBack.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 29, paddingBottom: 0, paddingRight: 0, width: 15, height: 16)
        emailImageView.centerYAnchor.constraint(equalTo: emailBack.centerYAnchor).isActive = true 
        
        
        emailBack.addSubview(emailTextField)
        emailTextField.anchor(top: emailBack.topAnchor, left: emailImageView.rightAnchor, bottom: emailBack.bottomAnchor, right: emailBack.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        passwordBack.addSubview(passwordImageView)
        passwordImageView.anchor(top: nil, left: passwordBack.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 29, paddingBottom: 0, paddingRight: 0, width: 14, height: 16)
        passwordImageView.centerYAnchor.constraint(equalTo: passwordBack.centerYAnchor).isActive = true

        passwordBack.addSubview(passwordTextField)
        passwordTextField.anchor(top: passwordBack.topAnchor, left: passwordImageView.rightAnchor, bottom: passwordBack.bottomAnchor, right: passwordBack.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        
        view.addSubview(getStartedButton)
        getStartedButton.anchor(top: stackView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 56, paddingLeft: 0, paddingBottom: 0, paddingRight: 63, width: 200, height: 43)
        getStartedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        view.addSubview(createAccountButton)
        createAccountButton.anchor(top: getStartedButton.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 56, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 114, height: 20)
        createAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    @objc func handleLogin(){
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            print("Form is not valid")
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            
            if error != nil {
                print(error ?? "")
                return
            }

            self.messagesController?.fetchUserAndSetupNavBarTitle()
            self.dismiss(animated: true, completion: nil)
            
        })
    }
    
    @objc func handleCreateAccount(){
        let signupVC = SignUpVC()
        self.navigationController?.pushViewController(signupVC, animated: true)
    }
   

}
