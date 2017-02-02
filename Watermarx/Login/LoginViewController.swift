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

        view.addSubview(loginButton)

        loginButton.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(self.view).offset(-40)
            make.height.equalTo(44)
            make.centerX.equalTo(self.view)
            make.bottom.equalTo(self.view).offset(-20)
        }
    }

}
