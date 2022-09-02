//
//  TypeBooksCollectionViewCell.swift
//  ComposotionLayoutBooks
//
//  Created by Артем Галай on 1.09.22.
//

import UIKit

class TypeBooksCollectionViewCell: UICollectionViewCell {

    static let identifier = "typeBooksCell"

    var contents: CompositionalModel? {
        didSet {
            image.image = UIImage(named: contents?.image ?? "")
            nameLabel.text = contents?.mainTitle
            typeBooksLabel.text = contents?.description
        }
    }

    lazy var image: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var typeBooksLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fill
        stack.spacing = 2
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    let labelStack: UIStackView = {
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
        contentView.addSubview(labelStack)
        labelStack.addArrangedSubview(nameLabel)
        labelStack.addArrangedSubview(typeBooksLabel)
        labelStack.addArrangedSubview(image)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([

            labelStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            labelStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            labelStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            labelStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
        ])
    }

    override func prepareForReuse() {
        self.image.image = nil
    }

    
}
