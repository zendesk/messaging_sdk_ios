// swift-tools-version:5.3
import PackageDescription
let package = Package(
    name: "ZendeskMessagingSDK",
    platforms: [
        .iOS(.v11)
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
                 .exact("messaging_api_ios_version")),
        .package(name: "ZendeskCommonUISDK",
                 url: "https://github.com/zendesk/commonui_sdk_ios",
                 .exact("common_ui_sdk_ios_version"))
    ],
    targets: [
        .binaryTarget(
            name: "MessagingSDK",
            path: "MessagingSDK.xcframework"
        ),
        .target(name: "ZendeskMessagingSDKTargets",
                dependencies: [
                    .target(name: "MessagingSDK"),
                    .product(name: "ZendeskMessagingAPISDK", package: "ZendeskMessagingAPISDK"),
                    .product(name: "ZendeskCommonUISDK", package: "ZendeskCommonUISDK")
                ],
                path: "Sources"
        )
    ]
)
