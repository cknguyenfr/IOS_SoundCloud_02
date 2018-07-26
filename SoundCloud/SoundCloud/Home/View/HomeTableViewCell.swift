//
//  HomeTableViewCell.swift
//  SoundCloud
//
//  Created by Do Hung on 7/20/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import UIKit
import Reusable

final class HomeTableViewCell: UITableViewCell, NibReusable {
    private struct Identifier {
        static let homeCollectionViewCell = "HomeCollectionViewCell"
    }

    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var seeAllButton: UIButton!
    @IBOutlet private var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setContentForCell(viewController: UIViewController, genre: Genre, tag: Int) {
        collectionView.delegate = viewController as? UICollectionViewDelegate
        collectionView.dataSource = viewController as? UICollectionViewDataSource
        collectionView.register(cellType: HomeCollectionViewCell.self)
        collectionView.tag = tag
        titleLabel.text = genre.name
    }
}
