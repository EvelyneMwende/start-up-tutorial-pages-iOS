//
//  ViewController.swift
//  StartUpTutorialScreens
//
//  Created by Eclectics on 19/04/2022.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {
    var pageImages: NSArray!
    var pageViewController: UIPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Image names
        pageImages = NSArray(objects: "screen1","screen2","screen3")
        
        self.pageViewController = self.storyboard?.instantiateViewController(withIdentifier: "MyPageViewController") as! UIPageViewController
        
        self.pageViewController.dataSource = self
        
        var initialContentViewController = self.pageTutorialAtIndex(index: 0) as TutorialPageContentHolderViewController
        
        var viewControllers = NSArray(object: initialContentViewController)
        
        self.pageViewController.setViewControllers(viewControllers as! [UIViewController], direction: UIPageViewController.NavigationDirection.forward, animated: true, completion: nil)
        
        self.pageViewController.view.frame = CGRect(x: 0, y: 100, width: self.view.frame.size.width, height: self.view.frame.size.height-100)
        
        self.addChild(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        
        self.pageViewController.didMove(toParent: self)
        
        
    }

    @IBAction func skipButtonTapped(_ sender: Any) {
        
        //NOT SHOWING TUTORIAL ON STARTUP
        //remembering user's choice to skip tutorial
        let defaults = UserDefaults.standard
        defaults.setValue(true, forKey: "skipTutorialPages")
        defaults.synchronize()
        
        
        
        let nextView = self.storyboard?.instantiateViewController(withIdentifier: "TheNextViewController") as! TheNextViewController
        
        let appDelegate = UIApplication.shared.delegate
        appDelegate?.window??.rootViewController = nextView
        
        UIApplication.shared.windows.first?.rootViewController = nextView
        
        UIApplication.shared.windows.first?.makeKeyAndVisible()
        
        
//        var nextView: TheNextViewController = self.storyboard?.instantiateViewController(withIdentifier: "TheNextViewController") as! TheNextViewController
//
//        let appdelegate = UIApplication.shared.delegate as! AppDelegate
//
//        appdelegate.window!.rootViewController = nextView
        
        
    }
    
    func pageTutorialAtIndex(index: Int) -> TutorialPageContentHolderViewController {
        var pageContentViewController = self.storyboard?.instantiateViewController(withIdentifier: "TutorialPageContentHolderViewController") as! TutorialPageContentHolderViewController
        
        pageContentViewController.imageFileName = pageImages[index] as! String
        pageContentViewController.pageIndex = index
        
        return pageContentViewController
    }
    
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let viewController = viewController as! TutorialPageContentHolderViewController
                var index = viewController.pageIndex as Int
                
                if(index == 0 || index == NSNotFound)
                {
                    return nil
                }
                
                index -= 1
                
                return self.pageTutorialAtIndex(index: index)
        
    }

    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let viewController = viewController as! TutorialPageContentHolderViewController
                var index = viewController.pageIndex as Int
                
                if((index == NSNotFound))
                {
                    return nil
                }
                
                index += 1
                
                if(index == pageImages.count)
                {
                    return nil
                }
                
        return self.pageTutorialAtIndex(index: index)
        
    }

    

    func presentationCount(for pageViewController: UIPageViewController) -> Int{
        pageImages.count
    }


    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
}

