//
//  AppDelegate.swift
//  task
//
//  Created by Mac on 15/11/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if (window?.rootViewController as? UITabBarController) != nil {

              //Change unselected TintColor
              (window?.rootViewController as! UITabBarController).tabBar.tintColor = UIColor(red: 255/255, green: 102/255, blue: 0, alpha: 1.0)

              //If system has IOS 10 or newer
              if #available(iOS 10.0, *) {
                  //Change Unselected Tint Color
                  (window?.rootViewController as! UITabBarController).tabBar.unselectedItemTintColor = UIColor.black
              } else {
                  // Fallback on earlier versions
              }

          }


       
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

