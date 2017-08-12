// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "TLS",
    products: [
        .library(name: "TLS", targets: ["TLS"]),
    ],
    dependencies: [
        // Core extensions, type-aliases, and functions that facilitate common tasks.
        .package(url: "https://github.com/vapor/core.git", .branch("beta")),

        // Pure-Swift Sockets: TCP, UDP; Client, Server; Linux, macOS.
      	.package(url: "https://github.com/vapor/sockets.git", .branch("beta")),

        // LibreSSL / OpenSSL module map for Swift
        .package(url: "https://github.com/vapor/ctls.git", .upToNextMajor(from: "1.1.0")),
    ],
    targets: [
        .target(name: "TLS", dependencies: ["Core", "Sockets"]),
        .testTarget(name: "TLSTests", dependencies: ["TLS"]),
    ]
)
