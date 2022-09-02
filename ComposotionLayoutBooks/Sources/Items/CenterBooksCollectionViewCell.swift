//
//  CenterBooksCollectionViewCell.swift
//  ComposotionLayoutBooks
//
//  Created by Артем Галай on 2.09.22.
//

import UIKit

class CenterBooksCollectionViewCell: UICollectionViewCell {

    static let identifier = "centerBooksCell"

    var contents: CompositionalModel? {
        didSet {
            image.image = UIImage(named: contents?.image ?? "")
        }
    }

    lazy var image: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
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
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
        ])
    }
}
