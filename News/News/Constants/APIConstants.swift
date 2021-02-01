//
//  APIConstants.swift
//  News
//
//  Created by PavanaKC on 01/02/21.
//

import Foundation

let apiKey = "0d1a4df850f848fa81fe4fabe37a77d1"

enum ResponseKey: String {
    case articles = "articles"
    case title = "title"
    case author = "author"
    case description = "description"
    case imageUrl = "urlToImage"
}


enum URLConstants: String {
    case newsListUrl = "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey="
    case likesUrl = "https://cn-news-info-api.herokuapp.com/likes/"
    case commentUrl = "https://cn-news-info-api.herokuapp.com/comments/"
}
