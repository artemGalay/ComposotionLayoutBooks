//
//  MainViewController.swift
//  ComposotionLayoutBooks
//
//  Created by Артем Галай on 1.09.22.
//

import UIKit

class MainViewController: UIViewController {

    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TypeBooksCollectionViewCell.self, forCellWithReuseIdentifier: TypeBooksCollectionViewCell.identifier)
        collectionView.register(CenterBooksCollectionViewCell.self, forCellWithReuseIdentifier: CenterBooksCollectionViewCell.identifier)
        collectionView.register(BottomBooksCollectionViewCell.self, forCellWithReuseIdentifier: BottomBooksCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }

    private func setupHierarchy() {
        view.addSubview(collectionView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func createLayout() -> UICollectionViewCompositionalLayout {

        return UICollectionViewCompositionalLayout { sectionIndex, _ in

            switch sectionIndex {
            case 0:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))

                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(300))

                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [layoutItem])

                let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
                sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0)
                sectionLayout.orthogonalScrollingBehavior = .groupPagingCentered

                return sectionLayout
            case 1:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalWidth(0.9))

                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(300))

                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [layoutItem])
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

                let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
                sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                sectionLayout.orthogonalScrollingBehavior = .continuous

                return sectionLayout
            default:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.33))

                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension: .fractionalWidth(0.55))

                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [layoutItem])
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)

                let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
                sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                sectionLayout.orthogonalScrollingBehavior = .continuous

                return sectionLayout
            }
        }
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return CompositionalModel.modelsArray.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CompositionalModel.modelsArray[section].count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch indexPath.section {
        case 0 :
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: TypeBooksCollectionViewCell.identifier, for: indexPath) as? TypeBooksCollectionViewCell
            item?.contents = CompositionalModel.modelsArray[indexPath.section][indexPath.item]
            return item ?? UICollectionViewCell()
        case 1:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: CenterBooksCollectionViewCell.identifier, for: indexPath) as? CenterBooksCollectionViewCell
            item?.contents = CompositionalModel.modelsArray[indexPath.section][indexPath.item]
            return item ?? UICollectionViewCell()
        default:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: BottomBooksCollectionViewCell.identifier, for: indexPath) as? BottomBooksCollectionViewCell
            item?.contents = CompositionalModel.modelsArray[indexPath.section][indexPath.item]
            return item ?? UICollectionViewCell()
        }
    }
}

