//
//  KicterViewController.swift
//  floatingButton
//
//  Created by 60080252 on 2021/08/05.
//

import UIKit
import Floaty

class KicterViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		setFloatingButton()
	}
	
	func setFloatingButton() {
		var floatingBtn = Floaty()
		floatingBtn.buttonColor = .magenta
		floatingBtn.isDraggable = true
		floatingBtn.addItem(title: "MY케어")
		floatingBtn.addItem(title: "신한플러스")
		view.addSubview(floatingBtn)
	}
}

