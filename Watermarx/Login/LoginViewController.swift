//
//  LoginViewController.swift
//  Watermarx
//
//  Created by Aayush Kapoor on 26/01/17.
//  Copyright © 2017 Logiworks. All rights reserved.
//

import FacebookLogin
import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let loginButton = LoginButton(readPermissions: [.publicProfile])
        loginButton.center = view.center

        view.addSubview(loginButton)
    }

}
