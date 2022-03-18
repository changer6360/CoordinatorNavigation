//
//  MainCoordinator.swift
//  CoordinatorNavigation
//
//  Created by Tihomir Videnov on 16.03.22.
//

import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        let vc = ViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func openFirstScreen() {
        let child = FirstScreenCoordinator(navigationController: navigationController)
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.start()
    }
    
    func openSecondScreen(for product: Int) {
        let vc = SecondViewController.instantiate()
        vc.coordinator = self
        vc.selectedProduct = product
        navigationController.pushViewController(vc, animated: true)
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // Read the view controller we’re moving from.
           guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
               return
           }

           // Check whether our view controller array already contains that view controller. If it does it means we’re pushing a different view controller on top rather than popping it, so exit.
           if navigationController.viewControllers.contains(fromViewController) {
               return
           }

           // We’re still here – it means we’re popping the view controller, so we can check whether it’s a buy view controller
           if let firstScreenVC = fromViewController as? FirstViewController {
               // We're popping a buy view controller; end its coordinator
               childDidFinish(firstScreenVC.coordinator)
           }
    }
    
}
