// swift-tools-version:5.8

import PackageDescription

let package = Package(
    name: "NextPaywallPublic",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "NextPaywallPublic",
            targets: ["NextPaywallPublicTargets", "RevenueCat", "AppsFlyerLib", "Alamofire", "JGProgressHUD"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .binaryTarget(
            name: "NextPaywallPublic",
            path: "./Frameworks/NextPaywallPublic.xcframework"
        ),

        .binaryTarget(
            name: "RevenueCat",
            path: "./Frameworks/RevenueCat.xcframework"
        ),

        .binaryTarget(
            name: "JGProgressHUD",
            path: "./Frameworks/JGProgressHUD.xcframework"
        ),

        .binaryTarget(
            name: "AppsFlyerLib",
            path: "./Frameworks/AppsFlyerLib.xcframework"
        ),

        .binaryTarget(
            name: "Alamofire",
            path: "./Frameworks/Alamofire.xcframework"
        ),

        .target(
            name: "NextPaywallPublicTargets",
            dependencies: [
                "NextPaywallPublic",
                "RevenueCat",
                "JGProgressHUD",
                "AppsFlyerLib",
                "Alamofire",
            ],
            path: "NextPaywallPublicTargets"
        ),
    ]
)
