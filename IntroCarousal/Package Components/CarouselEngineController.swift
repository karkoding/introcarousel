//
//  CarouselEngineViewController.swift
//  IntroCarousal
//
//  Created by Karthik K Manoj on 07/07/22.
//

import UIKit

internal protocol CarouselEngineControllerDataSource: AnyObject {
    var initialViewController: UIViewController { get }
    func carouselEngineController(viewControllerAfter viewController: UIViewController) -> UIViewController?
    func carouselEngineController(viewControllerBefore viewController: UIViewController) -> UIViewController?
}

internal final class CarouselEngineController: UIPageViewController {
    internal var _dataSource: CarouselEngineControllerDataSource?

    internal init() {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
        dataSource = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setViewControllers(
            [_dataSource?.initialViewController ?? UIViewController()],
            direction: .forward,
            animated: true
        )
    }
}

extension CarouselEngineController: UIPageViewControllerDataSource {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {
        _dataSource?.carouselEngineController(viewControllerBefore: viewController)
    }

    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController
    ) -> UIViewController? {
        _dataSource?.carouselEngineController(viewControllerAfter: viewController)
    }
}
