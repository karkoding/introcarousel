//
//  CarouselEngineDataSource.swift
//  IntroCarousal
//
//  Created by Karthik K Manoj on 07/07/22.
//

import UIKit

internal final class CarouselEngineDataSource {
    private let viewControllers: [UIViewController]
    private let isLoopingEnabled: Bool

    internal init(viewControllers: [UIViewController], isLoopingEnabled: Bool) {
        self.viewControllers = viewControllers
        self.isLoopingEnabled = isLoopingEnabled
    }
}

extension CarouselEngineDataSource: CarouselEngineControllerDataSource {
    func carouselEngineController(viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = viewControllers.firstIndex(of: viewController) else { return nil }

        if currentIndex < viewControllers.count - 1 {
            return viewControllers[currentIndex + 1]
        } else {
            guard isLoopingEnabled else { return nil }
            return viewControllers.first
        }
    }

    func carouselEngineController(viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = viewControllers.firstIndex(of: viewController) else { return nil }

        if currentIndex == 0 {
            guard isLoopingEnabled else { return nil }
            return viewControllers.last
        } else {
            return viewControllers[currentIndex - 1]
        }
    }

    var initialViewController: UIViewController {
        viewControllers.first ?? UIViewController()
    }
}
