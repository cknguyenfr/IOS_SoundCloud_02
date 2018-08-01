//
//  LibraryViewController.swift
//  SoundCloud
//
//  Created by Do Hung on 7/24/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController {
    private struct Constant {
        static let images = ["Icon_Download", "Icon_Love", "Icon_Playlist"]
        static let titles = ["Download", "Favorite", "Playlist"]
        static let title = "Library"
        static let indexPlaylist = 2
    }
    
    private var listPlaylist = [Playlist]()

    @IBOutlet private var titleView: TitleView!
    @IBOutlet private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listPlaylist = DatabaseManager.shared.getListPlaylist()
        setTableView()
        setTitleView()
    }
    
    func setTableView() {
        tableView.register(cellType: LibraryCell.self)
    }
    
    func setTitleView() {
        titleView.setTitle(title: Constant.title)
        titleView.setShowLeftButton(isShow: false)
    }
}

extension LibraryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constant.titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: LibraryCell = tableView.dequeueReusableCell(for: indexPath)
        if indexPath.row < Constant.indexPlaylist {
            cell.setContentForCell(img: Constant.images[indexPath.row], title: Constant.titles[indexPath.row], number: listPlaylist[indexPath.row].listTrack.count)
        } else {
            cell.setContentForCell(img: Constant.images[indexPath.row], title: Constant.titles[indexPath.row], number: listPlaylist.count - Constant.indexPlaylist)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != Constant.indexPlaylist {
            
        }
    }
}
