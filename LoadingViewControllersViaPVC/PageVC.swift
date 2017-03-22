//
//  PageVC.swift
//  LoadingViewControllersViaPVC
//
//  Created by Jerrald Pieterman on 22-03-17.
//  Copyright © 2017 Jeppro. All rights reserved.
//

import UIKit

class PageVC: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    var index = 0
    
    var nameOfVCs = ["BlueContentVC", "RedContentVC"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.dataSource = self

        if let startingVC = contentAtIndex(index) {
            
            setViewControllers([startingVC], direction: .forward, animated: true, completion: nil)
        }
            
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var nameOfVC: String = ""
        
        if index == NSNotFound {
            
            return nil
        }
        
        index -= 1
        
        if index < 0 {
            
            index = nameOfVCs.count - 1
            
            nameOfVC = nameOfVCs[index]
        } else {
            
            nameOfVC = nameOfVCs[index]
        }

        if let content = getContentVCAtIndex(index, nameOfVC) {
            
            return content
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var nameOfVC: String = ""
        
        if index == NSNotFound || index >= nameOfVCs.count {
            
            return nil
        }
        
        index += 1
        
        if index >= nameOfVCs.count {
            
            index = 0
            
            nameOfVC = nameOfVCs[index]
        } else {
            
            nameOfVC = nameOfVCs[index]
        }

        if let content = getContentVCAtIndex(index, nameOfVC) {
            
            return content
        }
        
        return nil
    }
    
    
    
    func contentAtIndex(_ index: Int) -> UIViewController? {
        
        let nameOfVC = nameOfVCs[index]
        
        if index == NSNotFound || index < 0 || index >= nameOfVCs.count {
            
            return nil
        }
        
        if let content = getContentVCAtIndex(index, nameOfVC) {
            
            return content
        }
        
        
        return nil
    }
    
    
    func getContentVCAtIndex(_ index: Int, _ nameOfVC: String) -> UIViewController? {
    
        if nameOfVC == "BlueContentVC" {
            
            if let blueContentVC = storyboard?.instantiateViewController(withIdentifier: nameOfVC) as? BlueContentVC {
                
                // do whatever you want with BlueContentVC
                
                return blueContentVC
            }
        }
        
        if nameOfVC == "RedContentVC" {
            
            if let redContentVC = storyboard?.instantiateViewController(withIdentifier: nameOfVC) as? RedContentVC {
                
                // do whatever you want with RedContentVC
                
                return redContentVC
            }
        }
    
        return nil
    }
    
    
    
    
    
    

}
















