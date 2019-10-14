import Foundation
import UIKit

final class ArtistTableViewDelegate:NSObject, UITableViewDelegate, UITableViewDataSource {

    public var artistsInfo: [Artist]
    public var artistsNames:[String]=[]

    init(artistsInfo: [Artist]) {
        self.artistsInfo = artistsInfo
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artistsInfo.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:
            "CellIdentifier", for: indexPath) as? ArtistTableViewCell  else {
                fatalError("The dequeued cell is not an instance of ArtistsTableViewCell.")
        }

        if (artistsInfo.count > 0) {
            cell.artistNameLabel.text = artistsInfo[indexPath.row].name
        }
        cell.artistNameLabel.sizeToFit()
        cell.imageArtist.layer.cornerRadius = 5
        return cell
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }

}
