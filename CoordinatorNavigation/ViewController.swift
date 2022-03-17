//
//  ViewController.swift
//  CoordinatorNavigation
//
//  Created by Tihomir Videnov on 16.03.22.
//

import UIKit

class ViewController: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goToFirstVC(_ sender: Any) {
        coordinator?.openFirstScreen()
    }
    
    @IBAction func goToSecondVC(_ sender: Any) {
        coordinator?.openSecondScreen()
    }
}

