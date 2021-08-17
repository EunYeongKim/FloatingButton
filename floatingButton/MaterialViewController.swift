//
//  MaterialViewController.swift
//  floatingButton
//
//  Created by 60080252 on 2021/08/05.
//

import UIKit
import MaterialComponents.MaterialButtons

class MaterialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		setFloatingButton()
		setFloatingButton2()
        // Do any additional setup after loading the view.
    }
    
	func setFloatingButton() {
		let floatingBtn = MDCFloatingButton()
		floatingBtn.sizeToFit()
		floatingBtn.translatesAutoresizingMaskIntoConstraints = false
		floatingBtn.setTitle("MY", for: .normal)
		floatingBtn.backgroundColor = .darkGray
		floatingBtn.addTarget(self, action: #selector(tapFloating), for: .touchUpInside)
		
		view.addSubview(floatingBtn)
		view.addConstraint(NSLayoutConstraint(item: floatingBtn, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: -64))
		view.addConstraint(NSLayoutConstraint(item: floatingBtn, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: -32))
	}
	
	func setFloatingButton2() {
		var floatingBtn = MDCFloatingButton(shape: .default)
		floatingBtn.mode = .expanded
		
		floatingBtn.sizeToFit()
		floatingBtn.translatesAutoresizingMaskIntoConstraints = false
		
		floatingBtn.setTitle("치와와 ", for: .normal)
//		floatingBtn.setImage(UIImage(named: "치와와.png"), for: .normal)
		floatingBtn.setImage(UIImage(systemName: "moon.stars.fill"), for: .normal)
		
		floatingBtn.backgroundColor = .darkGray
		floatingBtn.addTarget(self, action: #selector(tapFloating), for: .touchUpInside)
		
		view.addSubview(floatingBtn)
		view.addConstraint(NSLayoutConstraint(item: floatingBtn, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: -80))
		view.addConstraint(NSLayoutConstraint(item: floatingBtn, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: -100))
	}

	@objc func tapFloating(sender: Any) {
		print("HEY")
	}
}
