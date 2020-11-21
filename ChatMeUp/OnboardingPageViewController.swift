//
//  OnboardingPageViewController.swift
//  ChatMeUp
//
//  Created by Aaron Cleveland on 11/20/20.
//

import Foundation
import UIKit

class OnboardingPageViewController: UIPageViewController {
    fileprivate var items: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        decoratePageControl()
        populateItems()
        if let firstViewController = items.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    fileprivate func decoratePageControl() {
        let pc = UIPageControl.appearance(whenContainedInInstancesOf: [OnboardingPageViewController.self])
        pc.currentPageIndicatorTintColor = .orange
        pc.pageIndicatorTintColor = .gray
    }
    
    fileprivate func populateItems() {
        let text = ["test1", "test2", "test3"]
        let backgroundColor: [UIColor] = [.systemIndigo, .red, .brown]
        
        for (index, t) in text.enumerated() {
            let c = createOnboardingItemController(with: t, with: backgroundColor[index])
            items.append(c)
        }
    }
    
    fileprivate func createOnboardingItemController(with titleText: String?, with color: UIColor?) -> UIViewController {
        let c = UIViewController()
        c.view = OnboardingScreens(titleText: titleText, background: color)
        
        return c
    }
}

extension OnboardingPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = items.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return items.last
        }
        
        guard items.count > previousIndex else {
            return nil
        }
        
        return items[previousIndex]
    }
    
    func pageViewController(_: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = items.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        guard items.count != nextIndex else {
            return items.first
        }
        
        guard items.count > nextIndex else {
            return nil
        }
        
        return items[nextIndex]
    }
    
    func presentationCount(for _: UIPageViewController) -> Int {
        return items.count
    }
    
    func presentationIndex(for _: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,
              let firstViewControllerIndex = items.firstIndex(of: firstViewController) else {
            return 0
        }
        
        return firstViewControllerIndex
    }
}
