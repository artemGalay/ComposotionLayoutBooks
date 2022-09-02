//
//  BottomBooksCollectionViewCell.swift
//  ComposotionLayoutBooks
//
//  Created by Артем Галай on 2.09.22.
//

import UIKit

class BottomBooksCollectionViewCell: UICollectionViewCell {

    static let identifier = "bottomBooksCell"

    var contents: CompositionalModel? {
        didSet {
            image.image = UIImage(named: contents?.image ?? "")
            numberLabel.text = String("\(contents?.nubmerOfItem ?? 0)")
            bookNumberLabel.text = contents?.mainTitle
            descriptionLabel.text = contents?.description
        }
    }

    lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var bookNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .white
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
        contentView.addSubview(image)
        contentView.addSubview(bookNumberLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(numberLabel)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -320),
            image.widthAnchor.constraint(equalToConstant: 40),
            image.heightAnchor.constraint(equalToConstant: 70),

            numberLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            numberLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            bookNumberLabel.leadingAnchor.constraint(equalTo: numberLabel.trailingAnchor, constant: 10),
            bookNumberLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -10),

            descriptionLabel.leadingAnchor.constraint(equalTo: numberLabel.trailingAnchor, constant: 10),
            descriptionLabel.topAnchor.constraint(equalTo: bookNumberLabel.bottomAnchor, constant: 5)
        ])
    }
}
