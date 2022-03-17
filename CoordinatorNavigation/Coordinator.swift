//
//  Coordinator.swift
//  CoordinatorNavigation
//
//  Created by Tihomir Videnov on 16.03.22.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
