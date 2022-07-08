//
//  ViewController.swift
//  IntroCarousal
//
//  Created by Karthik K Manoj on 06/07/22.
//

import UIKit

final class ViewController: UIViewController {

    private let viewList: [UIView] = {
        let view1 = UIView()
        view1.backgroundColor = .blue

        let view2 = UIView()
        view2.backgroundColor = .yellow

        let view3 = UIView()
        view3.backgroundColor = .green

        let view4 = UIView()
        view4.backgroundColor = .brown

        let view5 = UIView()
        view5.backgroundColor = .purple

        let view6 = UIView()
        view6.backgroundColor = .systemPink

        let view7 = UIView()
        view7.backgroundColor = .orange

        let view8 = UIView()
        view8.backgroundColor = .red

        return [view1, view2, view3, view4, view5]
    }()

    private let viewControllerList: [UIViewController] = {
        let vc1 = UIViewController()
        vc1.view.backgroundColor = .blue

        let vc2 = UIViewController()
        vc2.view.backgroundColor = .yellow

        let vc3 = UIViewController()
        vc3.view.backgroundColor = .green

        let vc4 = UIViewController()
        vc4.view.backgroundColor = .brown

        let vc5 = UIViewController()
        vc5.view.backgroundColor = .purple

        return [vc1, vc2, vc3, vc4, vc5]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addCarouselView()
       // uncomment below for view controller.
       // present(makeCarouselViewController(), animated: true)
    }

    private func addCarouselView() {
        let view1 = UIView()
        view1.backgroundColor = .blue

        let view2 = UIView()
        view2.backgroundColor = .yellow

        let view3 = UIView()
        view3.backgroundColor = .green

        // `CarouselView` with a fixed views
        let carouselView = CarouselView(views: [view1, view2, view3], isLoopingEnabled: true)

        // uncomment below for  `CarouselView` with a `dataSource`
        // let carouselView = CarouselView()
        // carouselView.dataSource = self

        view.addSubview(carouselView)
        carouselView.translatesAutoresizingMaskIntoConstraints = false
        carouselView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        carouselView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        carouselView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        carouselView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }

    private func makeCarouselViewController() -> UIViewController {
        let view1 = UIViewController()
        view1.view.backgroundColor = .red

        let view2 = UIViewController()
        view2.view.backgroundColor = .yellow

        let view3 = UIViewController()
        view3.view.backgroundColor = .green

        // `CarouselViewController` with fixed view controllers.
        //let carouselVC = CarouselViewController(viewControllers: [view1, view2, view3])

        // uncomment below for `CarouselViewController` with a `dataSource`
         let carouselVC = CarouselViewController()
         carouselVC.dataSource = self

        return carouselVC
      }
}

extension ViewController: CarouselViewDataSource {
    var initialView: UIView {
        viewList.first ?? UIView()
    }

    func carouselView(viewAfter view: UIView) -> UIView? {
        guard let currentIndex = viewList.firstIndex(of: view) else { return nil }

        if currentIndex < viewList.count - 1 {
            return viewList[currentIndex + 1]
        } else {
            return viewList.first
        }
    }

    func carouselView(viewBefore view: UIView) -> UIView? {
        guard let currentIndex = viewList.firstIndex(of: view) else { return nil }

        if currentIndex == 0 {
            return viewList.last
        } else {
            return viewList[currentIndex - 1]
        }
    }
}

extension ViewController: CarouselViewControllerDataSource {
    var initialViewController: UIViewController {
        viewControllerList.first ?? UIViewController()
    }

    func carouselViewController(viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = viewControllerList.firstIndex(of: viewController) else { return nil }

        if currentIndex < viewList.count - 1 {
            return viewControllerList[currentIndex + 1]
        } else {
            return viewControllerList.first
        }
    }

    func carouselViewController(viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = viewControllerList.firstIndex(of: viewController) else { return nil }

        if currentIndex == 0 {
            return viewControllerList.last
        } else {
            return viewControllerList[currentIndex - 1]
        }
    }
}
