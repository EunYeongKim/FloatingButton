//
//  JJFloatingViewController.swift
//  floatingButton
//
//  Created by 60080252 on 2021/08/05.
//

import UIKit
import JJFloatingActionButton

class JJFloatingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
		setFloatingButton()
    }
	
	func setFloatingButton() {
		let floatingBtn = JJFloatingActionButton()
		floatingBtn.buttonColor = .cyan
		floatingBtn.addItem(title: "MY케어", image: nil) { item in
			print("MY케어")
		}
		floatingBtn.addItem(title: "신한플러스", image: nil) { item in
			print("신한플러스")
		}
		
		view.addSubview(floatingBtn)
		floatingBtn.translatesAutoresizingMaskIntoConstraints = false
		floatingBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
		floatingBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
		
	}

}
