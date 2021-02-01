//
//  NewsListTableCell.swift
//  News
//
//  Created by PavanaKC on 01/02/21.
//

import UIKit
import CoreData

final class NewsListTableCell: UITableViewCell {

    @IBOutlet private weak var headLinesLabel: UILabel!
    @IBOutlet private weak var authorNameLabel: UILabel!
    @IBOutlet private weak var descriptionlabel: UILabel!
    @IBOutlet private weak var newsImage: UIImageView!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    //MARK: = private methods
    
    
    /// Set shadow for cell
    private func setupUI() {
        containerView.layer.cornerRadius = 10
        containerView.layer.masksToBounds = true
        
        containerView.layer.shadowOffset = CGSize(width: 0, height: 0)
        containerView.layer.shadowColor = UIColor.red.cgColor
        containerView.layer.shadowOpacity = 0.23
        containerView.layer.shadowRadius = 4
    }
    
    override func prepareForReuse() {
         super.prepareForReuse()
        newsImage.image = nil
     }
    
    
    /// Populate data to cell
    /// - Parameters:
    ///   - news: Core data entity containing data
    ///   - image: Image to update UI
    func populateCell(news: News, image: UIImage?) {
        headLinesLabel.text = news.headline
        authorNameLabel.text = "Author: " + (news.author ?? "_")
        descriptionlabel.text = news.explanation
        newsImage.image = image ?? UIImage(named: "placeholder")
    }
}
