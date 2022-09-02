//
//  CenterBooksCellHeader.swift
//  ComposotionLayoutBooks
//
//  Created by Артем Галай on 2.09.22.
//

import UIKit

class CenterBooksCellHeader: UICollectionReusableView {

    static let identifier = "centerBooksCellHeader"

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupHierarchy() {
        addSubview(titleLabel)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }
}
