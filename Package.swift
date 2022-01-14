// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "SourceKitten",
    products: [
        .executable(name: "sourcekitten", targets: ["sourcekitten"]),
        .library(name: "SourceKittenFramework", targets: ["SourceKittenFramework"])
    ],
    dependencies: [
        .package(name: "swift-argument-parser", url: "git@github.com:caicai5zi/swift-argument-parser.git", from: "1.0.1"),
        .package(name: "SWXMLHash", url: "git@github.com:caicai5zi/SWXMLHash.git", .upToNextMinor(from: "5.0.1")),
        .package(name: "Yams", url: "git@github.com:caicai5zi/Yams.git", from: "4.0.1"),
    ],
    targets: [
        .target(
            name: "sourcekitten",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "SourceKittenFramework",
            ]
        ),
        .target(
            name: "Clang_C"
        ),
        .target(
            name: "SourceKit"
        ),
        .target(
            name: "SourceKittenFramework",
            dependencies: [
                "Clang_C",
                "SourceKit",
                "SWXMLHash",
                "Yams",
            ]
        ),
        .testTarget(
            name: "SourceKittenFrameworkTests",
            dependencies: [
                "SourceKittenFramework"
            ],
            exclude: [
                "Fixtures",
            ]
        )
    ]
)
