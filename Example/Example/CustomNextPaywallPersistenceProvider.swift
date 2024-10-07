//
//  CustomNextPaywallPersistenceProvider.swift
//
//  Copyright (c) 2024 Light Apps Studio
//

import NextPaywallPublic
import UIKit

class CustomNextPaywallPersistenceProvider: NextPaywallPersistenceProvider {
    var premiumStatus: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "premiumStatus")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "premiumStatus")
        }
    }

    var savedPaywallURL: String? {
        get {
            return UserDefaults.standard.string(forKey: "savedPaywallURL")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "savedPaywallURL")
        }
    }
}
