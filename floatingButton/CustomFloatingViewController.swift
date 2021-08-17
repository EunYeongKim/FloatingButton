//
//  CustomFloatingViewController.swift
//  floatingButton
//
//  Created by 60080252 on 2021/08/11.
//

import UIKit

class CustomFloatingViewController: UIViewController {

	@IBOutlet weak var floatingStackView: UIStackView!
	@IBOutlet weak var btn1: UIButton!
	@IBOutlet weak var btn2: UIButton!
	@IBOutlet weak var btn3: UIButton!
	@IBOutlet weak var floatingButton: UIButton!
	
	var isShowFloating: Bool = false
	lazy var floatingMenus: [UIButton] = [self.btn1, self.btn2, self.btn3]
	lazy var floatingDimView: UIView = {
		let view = UIView(frame: self.view.frame)
		view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
		view.alpha = 0
		view.isHidden = true
		
		self.view.insertSubview(view, belowSubview: floatingButton)
		
		return view
	}()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		setUpUI()
    }
	
	func setUpUI() {
		self.floatingButton.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(floatingButtonHandler)))
	}
	
	@objc func floatingButtonHandler(gesture: UIPanGestureRecognizer) {
		let location = gesture.location(in: self.view)
		let draggedView = gesture.view
		draggedView?.center = location
		
		if gesture.state == .ended {
			//현재 floating button 이 왼쪽에 가까운지 오른쪽에 가까운지 계산해서 화면의 leading, trailing 50만큼만 떨어지도록 설정
			if self.floatingButton.frame.midX >= self.view.layer.frame.width / 2 {
				UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
					self.floatingButton.center.x = self.view.frame.width - 50
				}, completion: nil)
			} else {
				UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
					self.floatingButton.center.x = 50
				}, completion: nil)
			}
		}
	}
	
	@IBAction func touchUpInsideFloatingButton(_ sender: UIButton) {
		if isShowFloating {
			hideFloatingMenues()
			hideFloatingDim()
		} else {
			showFloatingMenus()
			showFloatingDim()
		}
		
		isShowFloating = !isShowFloating
	}
	
	func showFloatingMenus() {
		floatingMenus.forEach{ [weak self] button in
			button.isHidden = false
			button.alpha = 0
			
			UIView.animate(withDuration: 0.3) {
				button.alpha = 1
				self?.view.layoutIfNeeded()
			}
		}
	}
	
	func hideFloatingMenues() {
		floatingMenus.reversed().forEach{ button in
			UIView.animate(withDuration: 0.3) {
				button.isHidden = true
				self.view.layoutIfNeeded()
			}
		}
	}
	
	func showFloatingDim() {
		self.floatingDimView.isHidden = false

		UIView.animate(withDuration: 0.5) {
			self.floatingDimView.alpha = 1
		}
	}
	
	func hideFloatingDim() {
		UIView.animate(withDuration: 0.5, animations: {
			self.floatingDimView.alpha = 0
		}) { (_) in
			self.floatingDimView.isHidden = true
		}
	}
}
