//
//  CarouselViewController.swift
//  IntroCarousal
//
//  Created by Karthik K Manoj on 07/07/22.
//

import UIKit

public protocol CarouselViewControllerDataSource: AnyObject {
    var initialViewController: UIViewController { get }
    func carouselViewController(viewControllerAfter viewController: UIViewController) -> UIViewController?
    func carouselViewController(viewControllerBefore viewController: UIViewController) -> UIViewController?
}

public final class CarouselViewController: UIViewController {
    private let carouselEngineController = CarouselEngineController()
    
    public weak var dataSource: CarouselViewControllerDataSource?

    public init(viewControllers: [UIViewController], isLoopingEnabled: Bool = false) {
        super.init(nibName: nil, bundle: nil)
        carouselEngineController._dataSource = CarouselEngineDataSource(
            viewControllers: viewControllers,
            isLoopingEnabled: isLoopingEnabled
        )

        build()
    }

    public init() {
        super.init(nibName: nil, bundle: nil)
        carouselEngineController._dataSource = self
        build()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func build() {
        view.addSubview(carouselEngineController.view)
        addChild(carouselEngineController)
        carouselEngineController.didMove(toParent: self)
    }
}

extension CarouselViewController: CarouselEngineControllerDataSource {
    var initialViewController: UIViewController {
        dataSource?.initialViewController ?? UIViewController()
    }

    func carouselEngineController(viewControllerAfter viewController: UIViewController) -> UIViewController? {
        dataSource?.carouselViewController(viewControllerAfter: viewController)
    }

    func carouselEngineController(viewControllerBefore viewController: UIViewController) -> UIViewController? {
        dataSource?.carouselViewController(viewControllerBefore: viewController)
    }
}
