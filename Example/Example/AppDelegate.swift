//
//  AppDelegate.swift
//
//  Copyright (c) 2024 Light Apps Studio
//

import NextPaywallPublic
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        NextPaywallSettings.shared.configure(secretKey: "", persistenceProvider: CustomNextPaywallPersistenceProvider())

        AppHelper.shared.application(application, didFinishLaunchingWithOptions: launchOptions)

        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        AppHelper.shared.applicationDidBecomeActive(application)
    }

    // MARK: UISceneSession Lifecycle

    func application(_: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options _: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_: UIApplication, didDiscardSceneSessions _: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}
