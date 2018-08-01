//
//  CurrentPlaylistViewController.swift
//  SoundCloud
//
//  Created by Can Khac Nguyen on 7/24/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import UIKit
import Reusable

class CurrentPlaylistViewController: UIViewController {
    @IBOutlet private weak var tblListCurrentSong: UITableView!
    var dataArray = [Track]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableDisplay()
        registerCell()
    }
    
    func reloadPlaylist() {
        tblListCurrentSong?.reloadData()
    }
    
    private func setTableDisplay() {
        tblListCurrentSong.estimatedRowHeight = 70
        tblListCurrentSong.rowHeight = UITableViewAutomaticDimension
        tblListCurrentSong.separatorStyle = .none
    }
    
    private func registerCell() {
        tblListCurrentSong.register(cellType: CurrentPlaylistTableViewCell.self)
    }
}

extension CurrentPlaylistViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as CurrentPlaylistTableViewCell
        cell.fillData(index: indexPath.row + 1, track: dataArray[indexPath.row])
        return cell
    }
}
