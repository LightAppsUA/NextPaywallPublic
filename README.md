# NextPaywallPublic

NextPaywallPublic is a Swift framework designed to simplify the integration of paywalls in iOS applications. It provides a seamless way to configure paywalls, manage user subscriptions, and track analytics.

## Important Notes Before Setup

1. **Remove Conflicting Packages:**  
   Before integrating NextPaywallPublic, ensure the following packages are **removed** from your project to avoid conflicts:
   - **Alamofire**
   - **RevenueCat**
   - **AppsFlyer**

  
2. **AppsFlyer & RevenueCat Configuration:**  
   You **do not** need to configure **AppsFlyer** or **RevenueCat** manually.  
   - Avoid calling `AppsFlyerLib.shared().start()` or setting its delegate.  
   - Avoid calling `Purchases.configure(withAPIKey: ConstantKey.revenueCat)`, as these configurations are handled internally within the framework.


## Installation

NextPaywallPublic can be installed exclusively through the Swift Package Manager (SPM). To add it to your project, follow these steps:

1. Open your Xcode project.
2. Select your project in the Project Navigator.
3. Go to the **Package Dependencies** tab.
4. Click the **+** button to add a new package.
5. Enter the repository URL: `https://github.com/LightAppsUA/NextPaywallPublic`.
6. Choose the version range and click **Add Package**.

## Usage

### Setting Up

In your `AppDelegate.swift`, configure the `NextPaywallSettings`.  

```swift
import NextPaywallPublic

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        NextPaywallSettings.shared.configure(secretKey: "YOUR_SECRET_KEY", persistenceProvider: CustomNextPaywallPersistenceProvider())
        AppHelper.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        AppHelper.shared.applicationDidBecomeActive(application)
    }
}
```

## Custom Persistence Provider

You need to implement a custom persistence provider to manage the premium status of the user. 

```swift
import NextPaywallPublic

class CustomNextPaywallPersistenceProvider: NextPaywallPersistenceProvider {
    var premiumStatus: Bool {
        get { UserDefaults.standard.bool(forKey: "premiumStatus") }
        set { UserDefaults.standard.set(newValue, forKey: "premiumStatus") }
    }
}
```

If you already have a mechanism in place for checking the premium status (e.g., using UserDefaultsManager), integrate it as follows:

```swift
    var premiumStatus: Bool {
        get { UserDefaultsManager.shared.isPremium }
        set { UserDefaultsManager.shared.isPremium = newValue }
    }
```

If you don't have a something like UserDefaultsManager, you can continue using the built-in UserDefaults as shown earlier.

## Presenting the Paywall

In your view controller, use the NextPaywallPresenter to present the paywall:

```swift
import NextPaywallPublic

class ViewController: UIViewController {
    @IBAction func buttonPressed(_ sender: Any) {
        if let paywallVC = NextPaywallPresenter.shared.getPaywallVC(nativePaywallProvider: {
            let vc = NativePaywallViewController() // Your native paywall VC here
            return vc
        }) {
            paywallVC.modalPresentationStyle = .fullScreen
            self.present(paywallVC, animated: true)
        }
    }
}
```
