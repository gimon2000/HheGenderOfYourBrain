//
//  ViewController.swift
//  GenderBrain
//
//  Created by gimon on 06.10.2024.
//

import UIKit

class StartViewController: UIViewController {
    
    private lazy var descriptionText: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.font = .systemFont(ofSize: 17, weight: .semibold)
        view.tintColor = .darkText
        view.text = LocalizedText.descriptionText
        return view
    }()
    
    private lazy var stack: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 10
        view.distribution = .fillEqually
        view.alignment = .center
        return view
    }()
    
    private lazy var buttonMan: UIButton = {
        let view = UIButton()
        view.setTitle(
            "Муж",
            for: .normal
        )
        view.addTarget(
            self,
            action: #selector(clickButtonMan),
            for: .touchUpInside
        )
        view.backgroundColor = .systemBlue
        view.titleLabel?.font = .systemFont(ofSize: 22, weight: .bold)
        view.layer.cornerRadius = 16
        return view
    }()
    
    private lazy var buttonWoman: UIButton = {
        let view = UIButton()
        view.setTitle(
            "Жен",
            for: .normal
        )
        view.addTarget(
            self,
            action: #selector(clickButtonWoman),
            for: .touchUpInside
        )
        view.backgroundColor = .systemPink
        view.titleLabel?.font = .systemFont(ofSize: 22, weight: .bold)
        view.layer.cornerRadius = 16
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        [
            descriptionText,
            stack,
            buttonMan,
            buttonWoman
        ].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [
            descriptionText,
            stack
        ].forEach{
            view.addSubview($0)
        }
        
        [
            buttonMan,
            buttonWoman
        ].forEach{
            stack.addArrangedSubview($0)
        }
        
        addConstraintDescriptionText()
        addConstraintStack()
    }
    
    @objc private func clickButtonMan() {
        
    }
    
    @objc private func clickButtonWoman() {
        
    }
    
    private func addConstraintDescriptionText() {
        NSLayoutConstraint.activate(
            [
                descriptionText.topAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.topAnchor,
                    constant: constantConstraint.defaultOffset
                ),
                descriptionText.leadingAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                    constant: constantConstraint.defaultOffset
                ),
                descriptionText.trailingAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                    constant: -constantConstraint.defaultOffset
                )
            ]
        )
    }
    
    private func addConstraintStack() {
        NSLayoutConstraint.activate(
            [
                stack.bottomAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                    constant: -constantConstraint.defaultOffset
                ),
                stack.leadingAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                    constant: constantConstraint.defaultOffset
                ),
                stack.trailingAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                    constant: -constantConstraint.defaultOffset
                )
            ]
        )
    }
}

private struct constantConstraint {
    static let defaultOffset: CGFloat = 20
}
