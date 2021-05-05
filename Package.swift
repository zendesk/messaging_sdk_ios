// swift-tools-version:5.3
import PackageDescription
let package = Package(
    name: "ZendeskMessagingSDK",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "ZendeskMessagingSDK",
            targets: [
              "ZendeskMessagingSDKTargets"
            ]
        )
    ],
    dependencies: [
        .package(name: "ZendeskMessagingAPISDK",
                 url: "https://github.com/zendesk/messagingapi_sdk_ios",
                 from: "3.8.2"),
        .package(name: "ZendeskCommonUISDK",
                 url: "https://github.com/zendesk/commonui_sdk_ios",
                 from: "6.1.1")
    ],
    targets: [
        .binaryTarget(
            name: "ZendeskMessagingSDK",
            path: "MessagingSDK.xcframework"
        ),
        .target(name: "ZendeskMessagingSDKTargets",
                dependencies: [
                    .target(name: "ZendeskMessagingSDK"),
                    .product(name: "ZendeskMessagingAPISDK", package: "ZendeskMessagingAPISDK"),
                    .product(name: "ZendeskCommonUISDK", package: "ZendeskCommonUISDK")
                ],
                path: "Sources"
        )
    ]
)
