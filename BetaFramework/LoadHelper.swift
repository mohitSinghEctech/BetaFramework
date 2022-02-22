//
//  LoadHelper.swift
//  BetaFramework
//
//  Created by Mohit Kumar Singh on 21/02/22.
//

import UIKit

/**
 Protocol that view controllers should implement
 */
public protocol IsLoadedFromStoryboard {
    static var storyboardId: StoryboardInfo.Identifier { get }
    static var storyboardName: StoryboardInfo.Name { get }
}

/**
 Generic method to load view controller from storyboard
 */
public extension IsLoadedFromStoryboard where Self: UIViewController {

    static func loadFromStoryboard() -> Self {
        guard let viewController = createViewController(withId: storyboardId, from: storyboardName) as? Self else {
            fatalError("Couldn't load view controller \(storyboardId.rawValue)")
        }
        return viewController
    }

    private static func createViewController(withId identifier: StoryboardInfo.Identifier, from storyboard: StoryboardInfo.Name) -> UIViewController {
        // This will only work if the framework is installed with cocoapods
        if let sootheUIBundle = Bundle(identifier: "Nickelfox.BetaFramework"),
            sootheUIBundle.path(forResource: storyboard.rawValue, ofType: "storyboardc") != nil {
            return UIStoryboard(name: storyboard.rawValue, bundle: sootheUIBundle).instantiateViewController(withIdentifier: identifier.rawValue)
        }

        return UIStoryboard(name: storyboard.rawValue, bundle: nil).instantiateViewController(withIdentifier: identifier.rawValue)
    }
}

public enum StoryboardInfo {
    public struct Name {
        public let rawValue: String

        public init(_ name: String) {
            rawValue = name
        }
    }

    public struct Identifier {
        public let rawValue: String

        public init(_ identifier: String) {
            rawValue = identifier
        }
    }
}
