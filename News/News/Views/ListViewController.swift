//
//  ListViewController.swift
//  News
//
//  Created by PavanaKC on 01/02/21.
//

import UIKit

final class ListViewController: BaseViewController {

    //MARK: IBOutlets
    @IBOutlet private weak var newsListTableView: UITableView!

    //MARK: private variable
    private let listVM = ListVM()
    private let tableFooterHeight: CGFloat = 50
    private let tableRowHeight: CGFloat = 40
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        fetchNewsList()
    }
    
    //MARK: Private Functions
    private func setupTableView() {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: tableFooterHeight))
        footerView.backgroundColor = .clear
        newsListTableView.tableFooterView = footerView
        
        newsListTableView.estimatedRowHeight = tableRowHeight
    }
    
    private func fetchNewsList() {
        listVM.getNews { [weak self] isSuccess in
            guard let `self` = self else { return }
            if isSuccess {
                self.newsListTableView.reloadData()
            } else {
                self.showToastLabel(message: "Error while fetching news Information. Try again after sometime")
            }
        }
    }
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listVM.newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsListTableCell") as? NewsListTableCell
        else { return UITableViewCell() }
        
        cell.selectionStyle = .none
        let newsData = listVM.newsList[indexPath.row]
        cell.indicator.isHidden = false
        
        listVM.downloadImage(from: newsData.imageUrl ?? "") { data in
            cell.indicator.isHidden = true
            if let imageData = data {
                cell.populateCell(news: newsData, image: UIImage(data: imageData))
            } else {
                cell.populateCell(news: newsData, image: UIImage(named: "placeholder"))
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
