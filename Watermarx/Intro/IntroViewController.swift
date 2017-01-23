//
//  IntroViewController.swift
//  Watermarx
//
//  Created by Aayush Kapoor on 23/01/17.
//  Copyright © 2017 Logiworks. All rights reserved.
//

import Fusuma
import Sharaku
import UIKit

class IntroViewController: UIViewController {

    // MARK: - References

    @IBOutlet weak var cameraButton: UIButton!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Actions

    @IBAction func cameraButtonTapped(_ sender: Any) {
        let fusuma = FusumaViewController()
        fusuma.delegate = self
        fusuma.hasVideo = false
        present(fusuma, animated: true)
    }
}

// MARK: - Fusuma Delegate

extension IntroViewController: FusumaDelegate {
    func fusumaImageSelected(_ image: UIImage, source: FusumaMode) {
        let viewController = SHViewController(image: image)
        viewController.delegate = self
        navigationController?.pushViewController(viewController, animated: true)
    }

    func fusumaDismissedWithImage(_ image: UIImage, source: FusumaMode) {

    }

    func fusumaVideoCompleted(withFileURL fileURL: URL) {

    }

    func fusumaCameraRollUnauthorized() {

    }
}

extension IntroViewController: SHViewControllerDelegate {
    func shViewControllerImageDidFilter(image: UIImage) {

    }

    func shViewControllerDidCancel() {

    }
}

