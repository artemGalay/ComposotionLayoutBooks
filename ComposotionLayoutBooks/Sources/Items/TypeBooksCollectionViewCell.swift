//
//  TypeBooksCollectionViewCell.swift
//  ComposotionLayoutBooks
//
//  Created by Артем Галай on 1.09.22.
//

import UIKit

class TypeBooksCollectionViewCell: UICollectionViewCell {

    static let identifier = "typeBooksCell"

    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.shadowColor = UIColor.white.cgColor
//        image.layer.shadowOpacity = 0.3
//        image.layer.shadowOffset = .zero
//        image.layer.shadowRadius = 10
//        image.layer.shouldRasterize = true
        image.layer.rasterizationScale = UIScreen.main.scale
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var typeBooksLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let labelStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fill
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
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
        addSubview(mainStack)
        mainStack.addArrangedSubview(labelStack)
        labelStack.addArrangedSubview(typeBooksLabel)
        labelStack.addArrangedSubview(nameLabel)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            mainStack.heightAnchor.constraint(equalToConstant: 100),
            mainStack.widthAnchor.constraint(equalToConstant: 150)
        ])
    }

    override func prepareForReuse() {
        self.image.image = nil
    }

    
}
