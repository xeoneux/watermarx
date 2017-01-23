//
//  IntroViewController.swift
//  Watermarx
//
//  Created by Aayush Kapoor on 23/01/17.
//  Copyright © 2017 Logiworks. All rights reserved.
//

import ALCameraViewController
import FTImageViewer
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
                    self?.present(sharaku, animated: false, completion: nil)
                }
                
            })
        }
    }

    // MARK: - References

    @IBOutlet weak var imageGridView: FTImageGridView!
    @IBOutlet weak var cameraButton: UIButton!

    // MARK: - Lifecycle

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if firstTime {
            firstTime = false
            cameraButtonTapped(self)
        }

        showSavedImages()
    }

    // MARK: - Actions

    @IBAction func cameraButtonTapped(_ sender: Any) {
        present(cameraViewController, animated: true, completion: nil)
    }

    // MARK: - Misc

    func showSavedImages() {
        let array = [
            "https://static.pexels.com/photos/6644/sea-water-ocean-waves.jpg",
            "https://static.pexels.com/photos/6644/sea-water-ocean-waves.jpg",
            "http://loremflickr.com/330/240",
            "https://static.pexels.com/photos/6644/sea-water-ocean-waves.jpg",
            "http://loremflickr.com/350/240"
        ]
        imageGridView.showWithImageArray(array) { (buttonsArray, buttonIndex) in
            // in this tap block, preview images with one line of code
            FTImageViewer.sharedInstance.showImages(array, atIndex: buttonIndex, fromSenderArray: buttonsArray)
        }
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

