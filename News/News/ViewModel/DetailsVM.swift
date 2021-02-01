//
//  DetailsVM.swift
//  News
//
//  Created by PavanaKC on 01/02/21.
//

import Foundation

final class DetailsVM: BaseVM {
    
    /// Make API call to fetch Likes Data
    /// - Parameters:
    ///   - articleID: article ID for unique identification of the news
    ///   - currentNews: Selected news to update core data
    ///   - completion: Block to return control
    func getLikesInfo(articleID: String, currentNews: News, completion: @escaping (Bool) -> Void) {
        webservice.getRequest(URLString: URLConstants.likesUrl.rawValue + articleID) { [weak self] result in
            guard let `self` = self else { return }
            
            switch result {
            case .success(let response):
                let count = response[ResponseKey.likes.rawValue] as? Int
                self.updateCoreData(news: currentNews, count: count ?? 0, key: ResponseKey.likesCount.rawValue, completion: {
                    DispatchQueue.main.async {
                        completion(true)
                    }
                })
                
            case .failure(_):
                completion(false)
            }
        }
    }
    
    /// Make API call to fetch Commnets Data
    /// - Parameters:
    ///   - articleID: article ID for unique identification of the news
    ///   - currentNews: Selected news to update core data
    ///   - completion: Block to return control
    func getCommentsInfo(articleID: String, currentNews: News, completion: @escaping (Bool) -> Void) {
        webservice.getRequest(URLString: URLConstants.commentUrl.rawValue + articleID) { [weak self] result in
            guard let `self` = self else { return }
            
            switch result {
            case .success(let response):
                let count = response[ResponseKey.comments.rawValue] as? Int
                self.updateCoreData(news: currentNews, count: count ?? 0, key: ResponseKey.commentsCount.rawValue, completion: {
                    DispatchQueue.main.async {
                        completion(true)
                    }
                })
                
            case .failure(_):
                completion(false)
            }
        }
    }
    
    //MARK: Private methods
    
    
    /// Update new data into core data
    /// - Parameters:
    ///   - news: news data which is to be updated
    ///   - count: likes/comments count
    ///   - key: attribute name in core data entity
    ///   - completion: Block to return control
    private func updateCoreData(news: News, count: Int, key: String, completion: @escaping () -> Void) {
        moc.performAndWait {
            news.setValue(count, forKey: key)
            coreData.saveContext()
            completion()
        }
    }
}
