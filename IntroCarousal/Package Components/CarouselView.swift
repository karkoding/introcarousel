//
//  CarouselView.swift
//  IntroCarousal
//
//  Created by Karthik K Manoj on 07/07/22.
//

import UIKit

public protocol CarouselViewDataSource: AnyObject {
    var initialView: UIView { get }
    func carouselView(viewAfter view: UIView) -> UIView?
    func carouselView(viewBefore view: UIView) -> UIView?
}

public final class CarouselView: UIView {
    private let carouselEngineController = CarouselEngineController()

    public weak var dataSource: CarouselViewDataSource?

    public init(views: [UIView], isLoopingEnabled: Bool = false) {
        super.init(frame: .zero)

        let viewControllers = views.map { view -> UIViewController in
            let viewController = UIViewController()
            viewController.view = view
            return viewController
        }

        carouselEngineController._dataSource = CarouselEngineDataSource(
            viewControllers: viewControllers,
            isLoopingEnabled: isLoopingEnabled
        )
        
        build()
    }

    public init() {
        super.init(frame: .zero)
        carouselEngineController._dataSource = self
        build()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func build() {
        addSubview(carouselEngineController.view)
        carouselEngineController.view.translatesAutoresizingMaskIntoConstraints = false
        carouselEngineController.view.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        carouselEngineController.view.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        carouselEngineController.view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        carouselEngineController.view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    private func makeViewController(with view: UIView) -> UIViewController {
        let viewController = UIViewController()
        viewController.view = view
        return viewController
    }
}

extension CarouselView: CarouselEngineControllerDataSource {
    var initialViewController: UIViewController {
        guard let initialView = dataSource?.initialView else { return UIViewController() }
        return makeViewController(with: initialView)
    }

    func carouselEngineController(viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let nextView = dataSource?.carouselView(viewAfter: viewController.view) else { return nil }
        return makeViewController(with: nextView)

    }

    func carouselEngineController(viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let previousView = dataSource?.carouselView(viewBefore: viewController.view) else { return nil }
        return makeViewController(with: previousView)
    }
}
