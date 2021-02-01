//
//  BaseVM.swift
//  News
//
//  Created by PavanaKC on 01/02/21.
//

import Foundation

class BaseVM {
    var webservice = NetworkManager()
    let moc = coreData.persistentContainer.viewContext

    /// Download Image
    /// - Parameters:
    ///   - url: URL for the image
    ///   - completion: Block to return control
    func downloadImage(from url: String, completion: @escaping ((Data?) -> Void)) {
        print("Download Started")
        
        webservice.downloadImageFromUrl(imageUrl: url) { result in
            
            switch result {
            case .success(let response):
                let imageData = response as? Data
                DispatchQueue.main.async {
                    completion(imageData)
                }
            case .failure(_):
                completion(nil)
            }
        }
    }
}
