//
//  ViewController.swift
//  BAt_D
//
//  Created by idea on 2017/12/26.
//  Copyright © 2017年 idea. All rights reserved.
//

import UIKit
import BATabBarController

enum BATabBarType {
    case WithText, NoText
}

class ViewController: UIViewController,BATabBarControllerDelegate {
    var firstTime: Bool!
    var demoType: BATabBarType!
    var vc: BATabBarController!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.firstTime = true
        self.demoType = .NoText
    }

    override func viewDidLayoutSubviews() {
        if self.firstTime {
            var tabBarItem: BATabBarItem!
            var tabBarItem2: BATabBarItem!
            var tabBarItem3: BATabBarItem!
            var tabBarItem4: BATabBarItem!
            let vc1: UIViewController = UIViewController()
            let vc2: UIViewController = UIViewController()
            let vc3: UIViewController = UIViewController()
            vc1.view.backgroundColor = UIColor(hex: 0x222B30)
            vc2.view.backgroundColor = UIColor(hex: 0x222B30)
            vc3.view.backgroundColor = UIColor.orange
            switch self.demoType {
            case .WithText:
                
                let option1: NSMutableAttributedString = NSMutableAttributedString(string: "Feed")
                option1.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor(hex: 0xF0F2F6), range: NSMakeRange(0, option1.length))
                tabBarItem = BATabBarItem(image: UIImage(named: "icon1_unselected"), selectedImage: UIImage(named: "icon1"), title: option1)
                let badge: BATabBarBadge = BATabBarBadge(value: 22, backgroundColor: UIColor.red)
                tabBarItem.badge = badge
                let option2: NSMutableAttributedString = NSMutableAttributedString(string: "Home")
                option2.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor(hex: 0xF0F2F6), range: NSMakeRange(0, option2.length))
                tabBarItem2 = BATabBarItem(image: UIImage(named: "icon2_unselected"), selectedImage: UIImage(named: "icon2"), title: option2)
                let option3: NSMutableAttributedString = NSMutableAttributedString(string: "Profile")
                option3.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor(hex: 0xF0F2F6), range: NSMakeRange(0, option3.length))
                tabBarItem3 = BATabBarItem(image: UIImage(named: "icon3_unselected"), selectedImage: UIImage(named: "icon3"), title: option3)
                break
                
            case .NoText:
                
                tabBarItem = BATabBarItem(image: UIImage(named: "icon1_unselected"), selectedImage: UIImage(named: "icon1"))
//                let badge: BATabBarBadge = BATabBarBadge(value: 8, backgroundColor: UIColor.red)
//                tabBarItem.badge = badge
                tabBarItem2 = BATabBarItem(image: UIImage(named: "icon2_unselected"), selectedImage: UIImage(named: "icon2"))
                tabBarItem3 = BATabBarItem(image: UIImage(named: "icon3_unselected"), selectedImage: UIImage(named: "icon3"))
//                let badge3: BATabBarBadge = BATabBarBadge(value: 8234, backgroundColor: UIColor.red)
//                tabBarItem3.badge = badge3
                tabBarItem4 = BATabBarItem(image: UIImage(named: "icon3_unselected"), selectedImage: UIImage(named: "icon3"))
                break
                
            default:
                
                //what are you doing here?
                break
            }
            self.vc = BATabBarController()
            //tab bar background color example
            //        self.vc.tabBarBackgroundColor = [UIColor blackColor];
            //tab bar item stroke color example
            //        self.vc.tabBarItemStrokeColor = [UIColor blueColor];
            //Tab bar line width example
            //        self.vc.tabBarItemLineWidth = 1.0;
            //Hides the tab bar when true
            //        self.vc.hidesBottomBarWhenPushed = YES;
            //        self.vc.tabBar.hidden = YES;
            self.vc.viewControllers = [vc1,vc2,vc3,vc3]
            self.vc.tabBarItems = [tabBarItem,tabBarItem2,tabBarItem3,tabBarItem4]
            self.vc.tabBarBackgroundColor = UIColor.white
            self.vc.setSelectedView(vc2, animated: false)
            self.vc.delegate = self
            self.view.addSubview(self.vc.view)
            self.firstTime = false
        }
    }
    
    func tabBarController(_ tabBarController: BATabBarController, didSelect viewController: UIViewController) {
        print("Delegate success!")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

