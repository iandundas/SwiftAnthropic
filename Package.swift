// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftAnthropic",
    platforms: [
         .iOS(.v15),
         .macOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SwiftAnthropic",
            targets: ["SwiftAnthropic"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        // AsyncHTTPClient and NIOFoundationCompat back `AsyncHTTPClientAdapter`, which is
        // `#if os(Linux)` in its entirety. SPM resolves package dependencies for every
        // platform even when the target dependency is `.when(platforms: [.linux])`, so
        // declaring them would add 19 transitive packages to an Apple-only consumer's
        // graph. Restore both if this fork ever needs to build for Linux.
        .target(
            name: "SwiftAnthropic",
            path: "Sources/Anthropic"),
        .testTarget(
            name: "SwiftAnthropicTests",
            dependencies: ["SwiftAnthropic"]),
    ]
)
