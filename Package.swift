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
                 url: "https://github.com/zendesk/messagingapi_sdk_ios/releases/download/3.8.1/MessagingAPI.xcframework.zip",
                 from: "3.8.1"
        )
    ],
    targets: [
        .binaryTarget(
            name: "ZendeskMessagingSDK",
            url: "https://github.com/zendesk/messaging_sdk_ios/releases/download/3.8.1/MessagingSDK.xcframework.zip",
            checksum: "302faf9822554defdcedeaeb4f48f66d20efb602aca1d86daf620fd04322c8af"
        ),
        .target(name: "ZendeskMessagingSDKTargets",
                dependencies: [
                    .target(name: "ZendeskMessagingSDK"),
                    .product(name: "ZendeskMessagingAPISDK", package: "ZendeskMessagingAPISDK")
                ],
                path: "Sources"
        )
    ]
)
