//
//  ViewController.swift
//  MovieDB
//
//  Created by Ishita Sinha on 19/04/18.
//  Copyright © 2018 Ishita Sinha. All rights reserved.
//

import UIKit

struct ApiInfo {
    static let BASE_URL="https://api.themoviedb.org/3"
    static let API_KEY="5bab8e18e6c0674ce8e50e8efd003e9f"
}
class CollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Loaded")
        let finalUrlString="\(ApiInfo.BASE_URL)/discover/movie?primary_release_year=2007&sort_by=vote_average.desc &api_key=\(ApiInfo.API_KEY)";
        //Encoding qruery paramter
        guard let escapedString =
            finalUrlString.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed) else { return }
        guard let url = URL(string: escapedString) else {return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            let dataAsString = String(data: data,encoding: .utf8)
            print(dataAsString)
        }.resume()
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

