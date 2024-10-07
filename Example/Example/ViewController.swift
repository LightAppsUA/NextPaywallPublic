//
//  ViewController.swift
//
//  Copyright (c) 2024 Light Apps Studio
//

import NextPaywallPublic
import UIKit

class ViewController: UIViewController {
    @IBAction func buttonPressed(_: Any) {
        if let paywallVC = NextPaywallPresenter.shared.getPaywallVC(nativePaywallProvider: {
            let vc = UIViewController()
            
            return vc
        }) {
            self.present(paywallVC, animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
