// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "gemini-pro-cli",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .executable(name: "gemini-pro-cli", targets: ["gemini-pro-cli"]),
    ],
    dependencies: [
        .package(url: "https://github.com/buhe/langchain-swift", .upToNextMajor(from: "0.43.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "gemini-pro-cli", dependencies: [
                .product(name: "LangChain", package: "langchain-swift"),
            ]),
        
    ]
)
