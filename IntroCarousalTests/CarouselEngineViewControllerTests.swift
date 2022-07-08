//
//  CarouselEngineViewControllerTests.swift
//  IntroCarousalTests
//
//  Created by Karthik K Manoj on 07/07/22.
//

@testable import IntroCarousal
import XCTest

final class CarouselEngineViewControllerTests: XCTestCase {
    func test_init_deliverViewControllersForViewsInOrder() {
        let view1 = UIView()
        let view2 = UIView()
        let view3 = UIView()

        let sut = CarouselEngineController(views: [view1, view2, view3])

        XCTAssertEqual(sut._viewControllers.count, 3)
        XCTAssertEqual(sut._viewControllers[0].view, view1)
        XCTAssertEqual(sut._viewControllers[1].view, view2)
        XCTAssertEqual(sut._viewControllers[2].view, view3)
    }

    func test_init_deliverViewControllersInOrder() {
        let viewController1 = UIViewController()
        let viewController2 = UIViewController()
        let viewController3 = UIViewController()

        let sut = CarouselEngineController(viewControllers: [viewController1, viewController2, viewController3])

        XCTAssertEqual(
            sut._viewControllers,
            [viewController1, viewController2, viewController3],
            "View controllers are not in the given order."
        )
    }
}
