//
//  ViewController.swift
//  LastFmPlayerApp
//
//  Created by Сергей on 23/09/2019.
//  Copyright © 2019 Effective. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var artistsTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    var searchActive : Bool = false
    var filtered:[String] = []
    var SA = SearchArtist()
    var artistsInfo:[Artist]=[]
    private lazy var tableDelegate = ArtistTableViewDelegate(artistsInfo:artistsInfo)
    var artistInfoStruct :ArtistInfoStruct? = nil


    func artistTableSetup() {
        artistsTableView.delegate = tableDelegate
        artistsTableView.dataSource=tableDelegate
    }

    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = true;
    }

    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchActive = false;
    }

    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
    }

    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
    }

    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {

        //  filtered = artistsInfo.filter({ (text) -> Bool in
        //                  let tmp: NSString = text
        //                  let range = tmp.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
        //                  return range.location != NSNotFound
        //              })
        //
        //              if(filtered.count == 0){
        //                  searchActive = false;
        //              } else {
        //                  searchActive = true;
        //              }
        //              self.tableView.reloadData()
        SA.search(artist: searchText){ [weak self] artistInfoStruct in
            guard let strongSelf = self else {
                return
            }
            self?.artistsInfo = artistInfoStruct.results.artistmatches.artist
            self!.tableDelegate.artistsInfo = self!.artistsInfo
            self!.artistsTableView.reloadData()
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        artistTableSetup()
        SA.search(artist: "Kanye"){ [weak self] artistInfoStruct in
            guard let strongSelf = self else {
                return
            }
            self?.artistsInfo = artistInfoStruct.results.artistmatches.artist
            self!.tableDelegate.artistsInfo = self!.artistsInfo
            self!.artistsTableView.reloadData()
            print(artistInfoStruct)
        }
    }
}
