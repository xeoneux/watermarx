//
//  IntroViewController.swift
//  Watermarx
//
//  Created by Aayush Kapoor on 23/01/17.
//  Copyright © 2017 Logiworks. All rights reserved.
//

import ALCameraViewController
import FacebookCore
import Sharaku
import UIKit

class IntroViewController: UIViewController {

    var firstTime = true
    var images: [UIImage]?
    var didSetImage = false
    var currentImage: UIImage?

    var cameraViewController: CameraViewController {
        return CameraViewController(croppingEnabled: false) { [weak self] image, asset in

            if image != nil {
                self?.didSetImage = true
                self?.currentImage = image
            } else {
                self?.didSetImage = false
                self?.currentImage = nil
            }

            self?.dismiss(animated: false, completion: {

                if self!.didSetImage {
                    let sharaku = SHViewController(image: self!.currentImage!)
                    sharaku.delegate = self
                    self?.present(sharaku, animated: true, completion: nil)
                }
                
            })
        }
    }

    // MARK: - References

    @IBOutlet weak var cameraButton: UIButton!

    // MARK: - Lifecycle

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if AccessToken.current == nil {
            let loginViewController = storyboard!.instantiateViewController(withIdentifier: "Login View Controller")
            present(loginViewController, animated: false, completion: nil)
        } else if firstTime {
            firstTime = false
            cameraButtonTapped(self)
        }
    }

    // MARK: - Actions

    @IBAction func cameraButtonTapped(_ sender: Any) {
        present(cameraViewController, animated: true, completion: nil)
    }

}

extension IntroViewController: SHViewControllerDelegate {
    func shViewControllerImageDidFilter(image: UIImage) {
        
    }

    func shViewControllerDidCancel() {
        // Override dismiss method
        present(cameraViewController, animated: false, completion: nil)
    }
}

