//
//  SignUpVC.swift
//  Pigeon
//
//  Created by Nasim Ahmed on 12.01.17.
//  Copyright © 2017 Nasim Ahmed. All rights reserved.
//

import UIKit
import Firebase

class SignUpVC: UIViewController{
    
    let backButton: UIButton = {
        let lb = UIButton(type: .system)
        lb.setImage(UIImage(named: "back_btn")?.withRenderingMode(.alwaysOriginal), for: .normal)
        lb.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        lb.addShadow()
        return lb
    }()
    
    let addPhotoButton: UIImageView = {
        let lb = UIImageView()
        lb.image = UIImage(named: "add_photo_btn")?.withRenderingMode(.alwaysOriginal)
        lb.layer.cornerRadius = 50
        lb.layer.masksToBounds = true
        return lb
    }()
    
    let nameBack: UIView = {
        let iv = UIView()
        iv.backgroundColor = #colorLiteral(red: 0.9996390939, green: 1, blue: 0.9997561574, alpha: 1)
        iv.layer.cornerRadius = 22
        iv.layer.masksToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.addShadow()
        return iv
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
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
    
    let signUpButton: UIButton = {
        let lb = UIButton(type: .system)
        lb.setImage(UIImage(named: "signup_btn")?.withRenderingMode(.alwaysOriginal), for: .normal)
        lb.addTarget(self, action: #selector(handleSignup), for: .touchUpInside)
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
    
    let nameImageView: UIImageView = {
        let uploadImageView = UIImageView()
        uploadImageView.image = UIImage(named: "emailIcon")
        uploadImageView.translatesAutoresizingMaskIntoConstraints = false
        return uploadImageView
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
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.9996390939, green: 1, blue: 0.9997561574, alpha: 1)
        setupViews()
        
        addPhotoButton.isUserInteractionEnabled = true
        addPhotoButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleAddPhoto)))
    }
    
    func setupViews(){
        view.addSubview(backButton)
        backButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: nil, paddingTop: 17, paddingLeft: 22, paddingBottom: 0, paddingRight: 0, width: 32, height: 50)
        
        
        view.addSubview(addPhotoButton)
        
        addPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 50, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        addPhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [nameBack, emailBack, passwordBack])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 40
        
        view.addSubview(stackView)
        stackView.anchor(top: addPhotoButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 69, paddingLeft: 63, paddingBottom: 0, paddingRight: 63, width: 0, height: 210)
        
        nameBack.addSubview(nameImageView)
        nameImageView.anchor(top: nil, left: nameBack.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 29, paddingBottom: 0, paddingRight: 0, width: 14, height: 14)
        nameImageView.centerYAnchor.constraint(equalTo: nameBack.centerYAnchor).isActive = true
        
        
        nameBack.addSubview(nameTextField)
        nameTextField.anchor(top: nameBack.topAnchor, left: nameImageView.rightAnchor, bottom: nameBack.bottomAnchor, right: nameBack.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        
        emailBack.addSubview(emailImageView)
        emailImageView.anchor(top: nil, left: emailBack.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 29, paddingBottom: 0, paddingRight: 0, width: 14, height: 14)
        emailImageView.centerYAnchor.constraint(equalTo: emailBack.centerYAnchor).isActive = true
        
        
        emailBack.addSubview(emailTextField)
        emailTextField.anchor(top: emailBack.topAnchor, left: emailImageView.rightAnchor, bottom: emailBack.bottomAnchor, right: emailBack.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        passwordBack.addSubview(passwordImageView)
        passwordImageView.anchor(top: nil, left: passwordBack.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 29, paddingBottom: 0, paddingRight: 0, width: 14, height: 16)
        passwordImageView.centerYAnchor.constraint(equalTo: passwordBack.centerYAnchor).isActive = true
        
        passwordBack.addSubview(passwordTextField)
        passwordTextField.anchor(top: passwordBack.topAnchor, left: passwordImageView.rightAnchor, bottom: passwordBack.bottomAnchor, right: passwordBack.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        
        view.addSubview(signUpButton)
        signUpButton.anchor(top: stackView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 56, paddingLeft: 0, paddingBottom: 0, paddingRight: 63, width: 200, height: 43)
        signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    

    @objc func handleAddPhoto(){
        let picker = UIImagePickerController()

        picker.delegate = self
        picker.allowsEditing = true

        present(picker, animated: true, completion: nil)
    }
    
    @objc func handleSignup(){
        guard let email = emailTextField.text, let password = passwordTextField.text, let name = nameTextField.text else {
            print("Form is not valid")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
            
            if error != nil {
                print(error!)
                return
            }
            
            guard let uid = user?.user.uid else {
                return
            }
            
            //successfully authenticated user
            let imageName = UUID().uuidString
            let storageRef = Storage.storage().reference().child("profile_images").child("\(imageName).jpg")
            
            if let profileImage = self.addPhotoButton.image, let uploadData = profileImage.jpegData(compressionQuality: 0.1) {
                
                storageRef.putData(uploadData, metadata: nil, completion: { (_, err) in
                    
                    if let error = error {
                        print(error)
                        return
                    }
                    
                    storageRef.downloadURL(completion: { (url, err) in
                        if let err = err {
                            print(err)
                            return
                        }
                        
                        guard let url = url else { return }
                        let values = ["name": name, "email": email, "profileImageUrl": url.absoluteString]
                        
                        self.registerUserIntoDatabaseWithUID(uid, values: values as [String : AnyObject])
                    })
                    
                })
            }
        })
    }
    
    
    @objc func handleBack(){
        self.navigationController?.popViewController(animated: true)
    }


}

extension SignUpVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    fileprivate func registerUserIntoDatabaseWithUID(_ uid: String, values: [String: AnyObject]) {
        let ref = Database.database().reference()
        let usersReference = ref.child("users").child(uid)
        
        usersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
            
            if err != nil {
                print(err!)
                return
            }
            
            //            self.messagesController?.fetchUserAndSetupNavBarTitle()
            //            self.messagesController?.navigationItem.title = values["name"] as? String
            let user = User(dictionary: values)
            
            self.navigationController?.popViewController(animated: true)
//            self.messagesController?.setupNavBarWithUser(user)
            
//            self.dismiss(animated: true, completion: nil)
        })
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)
        
        
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            selectedImageFromPicker = editedImage
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            
            selectedImageFromPicker = originalImage
        }
        
        if let selectedImage = selectedImageFromPicker {
            addPhotoButton.image = selectedImage
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("canceled picker")
        dismiss(animated: true, completion: nil)
    }
    
    // Helper function inserted by Swift 4.2 migrator.
    fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
        return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
    }
}
