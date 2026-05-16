// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Landoric",
    products: [
        .library(
            name: "Landoric",
            targets: ["Landoric"]
        ),
    ],
    targets: [
        .target(
            name: "Landoric",
            path: "Sources"
        ),
        .testTarget(
            name: "LandoricTests",
            dependencies: ["Landoric"],
            path: "Tests"
        ),
    ]
)
