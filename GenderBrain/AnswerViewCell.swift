//
//  AnswerViewCell.swift
//  GenderBrain
//
//  Created by gimon on 12.10.2024.
//

import UIKit

final class AnswerViewCell: UITableViewCell {
    
    private lazy var answerText: UILabel = {
        let view = UILabel()
        view.textColor = .darkText
        view.font = .systemFont(ofSize: 17, weight: .medium)
        view.numberOfLines = 0
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .systemBackground
        
        layer.cornerRadius = 20
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGreen.cgColor
        clipsToBounds = true
        
        [
            answerText
        ].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        addConstraintAnswerText()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraintAnswerText() {
        NSLayoutConstraint.activate(
            [
                answerText.topAnchor.constraint(
                    equalTo: topAnchor,
                    constant: ConstantsConstraint.defaultOffset
                ),
                answerText.bottomAnchor.constraint(
                    equalTo: bottomAnchor,
                    constant: -ConstantsConstraint.defaultOffset
                ),
                answerText.leadingAnchor.constraint(
                    equalTo: leadingAnchor,
                    constant: ConstantsConstraint.defaultOffset
                ),
                answerText.trailingAnchor.constraint(
                    equalTo: trailingAnchor,
                    constant: ConstantsConstraint.defaultOffset
                )
            ]
        )
    }
    
    func setText(text: String) {
        answerText.text = text
    }
}

extension AnswerViewCell {
    private enum ConstantsConstraint {
        static let defaultOffset: CGFloat = 20
    }
}
