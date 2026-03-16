// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "OSCountryPicker",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "OSCountryPicker",
            targets: ["OSCountryPicker"]
        ),
    ],
    targets: [
        .target(
            name: "OSCountryPicker",
            path: "Sources"
        )
    ]
)
