// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RxKakoSDK",
    platforms: [.iOS(.v11)],
    products: [
        .library(
            name: RxKakaoSDK.common.name,
            targets: [RxKakaoSDK.common.name]),
        .library(
            name: RxKakaoSDK.auth.name,
            targets: [RxKakaoSDK.auth.name]),
        .library(
            name: RxKakaoSDK.link.name,
            targets: [RxKakaoSDK.link.name]),
        .library(
            name: RxKakaoSDK.user.name,
            targets: [RxKakaoSDK.user.name]),
        .library(
            name: RxKakaoSDK.talk.name,
            targets: [RxKakaoSDK.talk.name]),
        .library(
            name: RxKakaoSDK.story.name,
            targets: [RxKakaoSDK.story.name]),
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift", from: "5.1.1"),
        .package(url: "https://github.com/RxSwiftCommunity/RxAlamofire", from: "5.3.1"),
        .package(name: Dependency.kakaoSDK.name, url: "https://github.com/minsOne/KakaoSDK-SwiftPM", .branch("master")),
    ],
    targets: [
        .target(
            name: RxKakaoSDK.common.name,
            dependencies: [.kakaoSDKcommon, .rxSwift, .rxAlamofire],
            path: RxKakaoSDK.common.path),
        .target(
            name: RxKakaoSDK.auth.name,
            dependencies: [.rxAlamofire, .kakaoSDKAuth, .rxKakaoSDKcommon, .rxSwift],
            path: RxKakaoSDK.auth.path),
        .target(
            name: RxKakaoSDK.link.name,
            dependencies: [.rxKakaoSDKcommon, .kakaoSDKLink, .rxSwift, .rxAlamofire],
            path: RxKakaoSDK.link.path),
        .target(
            name: RxKakaoSDK.user.name,
            dependencies: [.rxKakaoSDKcommon, .kakaoSDKUser, .rxKakaoSDKAuth, .rxSwift, .rxAlamofire],
            path: RxKakaoSDK.user.path),
        .target(
            name: RxKakaoSDK.talk.name,
            dependencies: [.rxKakaoSDKcommon, .kakaoSDKTalk, .rxKakaoSDKAuth, .rxSwift, .rxAlamofire],
            path: RxKakaoSDK.talk.path),
        .target(
            name: RxKakaoSDK.story.name,
            dependencies: [.rxKakaoSDKcommon, .kakaoSDKStory, .rxKakaoSDKAuth, .rxSwift, .rxAlamofire],
            path: RxKakaoSDK.story.path),
    ]
)


// MARK: - Utility
enum RxKakaoSDK: String {
    case common = "RxKakaoSDKCommon"
    case auth = "RxKakaoSDKAuth"
    case link = "RxKakaoSDKLink"
    case user = "RxKakaoSDKUser"
    case talk = "RxKakaoSDKTalk"
    case story = "RxKakaoSDKStory"
    
    var path: String { "Sources/RxKakoSDK-SPM/\(rawValue)" }
    var name: String { rawValue }
    var dependency: Target.Dependency { .init(stringLiteral: name) }
}

enum KakaoSDK: String {
    case common = "KakaoSDKCommon"
    case auth = "KakaoSDKAuth"
    case template = "KakaoSDKTemplate"
    case link = "KakaoSDKLink"
    case user = "KakaoSDKUser"
    case talk = "KakaoSDKTalk"
    case story = "KakaoSDKStory"
    case navi = "KakaoSDKNavi"
    
    var name: String { rawValue }
    var dependency: Target.Dependency { .init(stringLiteral: name) }
}

enum Dependency: String {
    case rxAlamofire = "RxAlamofire"
    case kakaoSDK = "KakaoSDK"
    case alamofire = "Alamofire"
    case rxSwift = "RxSwift"
    case rxCocoa = "RxCocoa"

    var name: String { return rawValue }
    var dependency: Target.Dependency { .init(stringLiteral: name) }
    var path: String? {
        return nil
    }
}

extension Target.Dependency {
    static var rxSwift: Self { Target.Dependency(stringLiteral: Dependency.rxSwift.name) }
    static var rxCocoa: Self { .product(name: Dependency.rxCocoa.name, package: Dependency.rxSwift.name) }
    
    static var rxKakaoSDKcommon: Self { Target.Dependency(stringLiteral: RxKakaoSDK.common.name) }
    static var rxKakaoSDKAuth: Self { Target.Dependency(stringLiteral: RxKakaoSDK.auth.name) }
    static var rxAlamofire: Self { Target.Dependency(stringLiteral: Dependency.rxAlamofire.name) }
    static var kakaoSDK: Self { Target.Dependency(stringLiteral: Dependency.kakaoSDK.name) }
    
    static var kakaoSDKcommon: Self { .product(name: KakaoSDK.common.name, package: Dependency.kakaoSDK.name) }
    static var kakaoSDKAuth: Self { .product(name: KakaoSDK.auth.name, package: Dependency.kakaoSDK.name) }
    static var kakaoSDKLink: Self { .product(name: KakaoSDK.link.name, package: Dependency.kakaoSDK.name) }
    static var kakaoSDKTalk: Self { .product(name: KakaoSDK.talk.name, package: Dependency.kakaoSDK.name) }
    static var kakaoSDKUser: Self { .product(name: KakaoSDK.user.name, package: Dependency.kakaoSDK.name) }
    static var kakaoSDKStory: Self { .product(name: KakaoSDK.story.name, package: Dependency.kakaoSDK.name) }
    static var kakaoSDKTemplate: Self { Target.Dependency(stringLiteral: KakaoSDK.template.name) }
}
