//
//  TestViewController.swift
//  GenderBrain
//
//  Created by gimon on 09.10.2024.
//

import UIKit

final class TestViewController: UIViewController {
    private lazy var question: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.font = .systemFont(ofSize: 17, weight: .semibold)
        view.tintColor = .darkText
        //TODO: - delete text
        view.text = "\tКогда надо разобраться в простой или дорожной карте вы:"
        return view
    }()
    
    private lazy var dismiss: UIButton = {
        let view = UIButton()
        view.setTitle(
            LocalizedText.dismissButtonText,
            for: .normal
        )
        view.addTarget(
            self,
            action: #selector(clickDismiss),
            for: .touchUpInside
        )
        view.setTitleColor(
            .darkText,
            for: .normal
        )
        return view
    }()
    
    private lazy var tableAnswer: UITableView = {
        let view = UITableView()
        view.separatorStyle = .none
        return view
    }()
    
    private let cellReuseIdentifier = "CellReuseIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = LocalizedText.tittleText
        
        tableAnswer.register(
            AnswerViewCell.self,
            forCellReuseIdentifier: cellReuseIdentifier
        )
        tableAnswer.delegate = self
        tableAnswer.dataSource = self
        
        [
            question,
            tableAnswer,
            dismiss
        ].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        addConstraintQuestion()
        addConstraintTableAnswer()
        addConstraintDismiss()
    }
    
    @objc private func clickDismiss() {
        //TODO: - add body
    }
    
    private func addConstraintQuestion() {
        NSLayoutConstraint.activate(
            [
                question.topAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.topAnchor,
                    constant: constantConstraint.defaultOffset
                ),
                question.leadingAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                    constant: constantConstraint.defaultOffset
                ),
                question.trailingAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                    constant: -constantConstraint.defaultOffset
                )
            ]
        )
    }
    
    private func addConstraintTableAnswer() {
        NSLayoutConstraint.activate(
            [
                tableAnswer.topAnchor.constraint(
                    equalTo: question.bottomAnchor,
                    constant: constantConstraint.defaultOffset
                ),
                tableAnswer.bottomAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                    constant: constantConstraint.defaultOffset
                ),
                tableAnswer.leadingAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                    constant: constantConstraint.defaultOffset
                ),
                tableAnswer.trailingAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                    constant: -constantConstraint.defaultOffset
                )
            ]
        )
    }
    
    private func addConstraintDismiss() {
        NSLayoutConstraint.activate(
            [
                dismiss.bottomAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                    constant: -constantConstraint.defaultOffset
                ),
                dismiss.centerXAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.centerXAnchor
                )
            ]
        )
    }
}

private struct constantConstraint {
    static let defaultOffset: CGFloat = 20
}

extension TestViewController: UITableViewDelegate {
    
}

extension TestViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO: - add param
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: cellReuseIdentifier,
            for: indexPath
        ) as? AnswerViewCell else {
            return UITableViewCell()
        }
        //TODO: - add param
        cell.setText(text: "в затруднении и часто просите помочь вам")
        return cell
    }
}

//@available(iOS 17, *)
//#Preview{
//    return TestViewController()
//}
