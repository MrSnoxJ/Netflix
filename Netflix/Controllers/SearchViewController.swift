//
//  SearchViewController.swift
//  Netflix
//
//  Created by Yerasyl Sharipov on 15.04.2023.
//

import UIKit

class SearchViewController: UIViewController {

    
    private let discoverTable : UITableView = {
        let table = UITableView()
        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.idetifier)
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Top Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        
        view.addSubview(discoverTable)
        discoverTable.delegate = self
        discoverTable.dataSource = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        discoverTable.frame = view.bounds
    }
    


}
extension SearchViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.idetifier, for: indexPath) as? TitleTableViewCell else {
            return  UITableViewCell()
            
        }
        return cell;
    }
}
