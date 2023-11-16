//
//  tabBarViewController.swift
//  task
//
//  Created by Mac on 15/11/23.
//

import UIKit

class tabBarViewController: UITabBarController {

    @IBOutlet weak var tabBarRoller: UITabBar!
    
    override var selectedIndex: Int { // Mark 1
            
            didSet {
                guard let selectedViewController = viewControllers?[selectedIndex] else { return }
                selectedViewController.tabBarItem.setTitleTextAttributes([.font: UIFont.boldSystemFont(ofSize: 13)], for: .normal)
            }
        }
        
        override var selectedViewController: UIViewController? { // Mark 2
            didSet {
                
                guard let viewControllers = viewControllers else { return }
                for viewController in viewControllers {
                    if viewController == selectedViewController {
                        viewController.tabBarItem.setTitleTextAttributes([.font: UIFont.boldSystemFont(ofSize: 13)], for: .normal)
                        
                    } else { viewController.tabBarItem.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 12)], for: .normal) }
                }
            }
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarRoller.layer.masksToBounds = true
        self.tabBarRoller.layer.cornerRadius = 12 // whatever you want
        self.tabBarRoller.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner] // only the top right and left corners
        let tabBarItems = tabBarRoller.items! as [UITabBarItem]
        self.selectedIndex = 2
        //tabBarItems[2].title = nil
        tabBarItems[2].imageInsets = UIEdgeInsets(top: 6,left: 0,bottom: -6,right: 0)
        // Do any additional setup after loading the view.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for:.selected)
        UITabBar.appearance().backgroundColor = UIColor(red:1, green:0, blue:0, alpha:1)
        UITabBar.appearance().tintColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1) // New!!
            self.tabBarController?.tabBar.layer.masksToBounds = true
            self.tabBarController?.tabBar.isTranslucent = true
            self.tabBarController?.tabBar.barStyle = .default
            self.tabBarController?.tabBar.layer.cornerRadius = 25
            self.tabBarController?.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

        }

}
