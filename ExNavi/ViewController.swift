//
//  ViewController.swift
//  ExNavi
//
//  Created by 김종권 on 2024/02/22.
//

import UIKit

class ViewController: UIViewController {
    private let button = {
        let button = UIButton()
        button.setTitle("present naviVC", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        button.addAction(UIAction(handler: { [weak self] _ in
            let firstVC = FirstVC()
            let navi = UINavigationController(rootViewController: firstVC)
            self?.present(navi, animated: true)
        }), for: .touchUpInside)
    }
}

class FirstVC: UIViewController {
    private let button = {
        let button = UIButton()
        button.setTitle("push", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        button.addAction(UIAction(handler: { [weak self] _ in
            let vc = SecondVC()
            vc.view.backgroundColor = .gray
            self?.navigationController?.pushViewController(vc, animated: true)
        }), for: .touchUpInside)
    }
}

class SecondVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("(viewDidLoad) naviVC:", navigationController)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("(viewWillAppear) naviVC:", navigationController)
    }
}
