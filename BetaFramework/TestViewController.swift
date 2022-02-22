//
//  TestViewController.swift
//  BetaFramework
//
//  Created by Mohit Kumar Singh on 21/02/22.
//

import UIKit

public class TestViewController: UIViewController, IsLoadedFromStoryboard  {
    
    public static var storyboardName = StoryboardInfo.Name("Resten")
    public static var storyboardId = StoryboardInfo.Identifier("TestViewController")

    override public func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
