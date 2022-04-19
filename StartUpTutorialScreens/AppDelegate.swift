//
//  AppDelegate.swift
//  StartUpTutorialScreens
//
//  Created by Eclectics on 19/04/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //NOT SHOWING TUTORIAL ON STARTUP
        //remembering user's choice to skip tutorial
        let defaults = UserDefaults.standard
        let skipTutorialPages = defaults.bool(forKey: "skipTutorialPages")
        print(skipTutorialPages)
        
        if skipTutorialPages{
            
            let mainStoryoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let nextView = mainStoryoard.instantiateViewController(withIdentifier: "TheNextViewController") as! TheNextViewController
            
            let appDelegate = UIApplication.shared.delegate
            appDelegate?.window??.rootViewController = nextView
            
            //window?.rootViewController = nextView
            UIApplication.shared.windows.first?.rootViewController = nextView
            
            UIApplication.shared.windows.first?.makeKeyAndVisible()
            
            
        }
        else{
            UIPageControl.appearance().pageIndicatorTintColor = UIColor.lightGray
            UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.blue
        }
        
        //setting color for the dots for the page controller
//        UIPageControl.appearance().pageIndicatorTintColor = UIColor.lightGray
//        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.blue
        
        
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

