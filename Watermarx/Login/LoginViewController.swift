//
//  LoginViewController.swift
//  Watermarx
//
//  Created by Aayush Kapoor on 26/01/17.
//  Copyright © 2017 Logiworks. All rights reserved.
//

import FacebookLogin
import SnapKit
import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let loginButton = LoginButton(readPermissions: [.publicProfile])

        loginButton.delegate = self

        view.addSubview(loginButton)

        loginButton.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(44)
            make.width.equalTo(self.view).offset(-44)

            make.centerX.equalTo(self.view)
            make.bottom.equalTo(self.view).offset(-22)
        }
    }

}

extension LoginViewController: LoginButtonDelegate {

    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
        print("Logged In")

        dismiss(animated: true, completion: nil)

        print(result)
    }

    func loginButtonDidLogOut(_ loginButton: LoginButton) {
        print("Logged Out")
    }

}
