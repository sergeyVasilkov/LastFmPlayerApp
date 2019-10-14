import Foundation

class SearchArtist{
    private let APIKey = "2c3aa1e0b3f896ea96e2fb00f79a093c"

    func search(artist:String, completion: @escaping (ArtistInfoStruct)->Void){
        let session = URLSession.shared
        let artistRequestURL = NSURL(string:"http://ws.audioscrobbler.com/2.0/?method=artist.search&artist="+artist+"&api_key=2c3aa1e0b3f896ea96e2fb00f79a093c&format=json")!

        let dataTask = session.dataTask(with: artistRequestURL as URL) {
            (data: Data?, response: URLResponse?, error: Error?) in 
            if let error = error {
                // Case 1: Error
                // We got some kind of error while trying to get data from the server.
                print("Error:\n\(error)")
            } else {
                // Case 2: Success
                // We got a response from the server!
                print("Raw data:\n\(data!)\n")
                let dataString = String(data: data!, encoding: String.Encoding.utf8)
                                do {
                                    let myStruct = try JSONDecoder().decode(ArtistInfoStruct.self, from: data!)
                                    DispatchQueue.main.async {
                                        completion(myStruct)
                                    }
                                //    print("hello")
                                        // print (myStruct)
                                } catch let error {
                                    print(error)
                                }
                //print("Human-readable data:\n\(dataString!)")
            }
        }
        dataTask.resume()
    }
}

