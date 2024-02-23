//
//  HomeViewController.swift
//  Netflix
//
//  Created by Yerasyl Sharipov on 15.04.2023.
//

import UIKit



enum Sections: Int{
    case TredingMovies = 0
    case TrendingTv = 1
    case Popular = 2
    case Upcoming = 3
    case TopRated = 4
}
class HomeViewController: UIViewController {
    
    let sectionTitle : [String] = ["Trending Movies","Trending Tv","Popular" , "Upcoming Movies", "Top rated"]
     
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.idetify)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        configureNavbar()
        
        let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 500))
        
        homeFeedTable.tableHeaderView = headerView
        
    }
    private func configureNavbar() {
           var image = UIImage(named: "netflix_logo")
           image = image?.withRenderingMode(.alwaysOriginal)
           navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
           
           navigationItem.rightBarButtonItems = [
               UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
               UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
           ]
           navigationController?.navigationBar.tintColor = .white
       }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        homeFeedTable.frame = view.bounds
        
    }
 
    
}
extension HomeViewController : UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.idetify,for: indexPath) as? CollectionViewTableViewCell else{
            return UITableViewCell()
        }
        switch indexPath.section {
        case Sections.TredingMovies.rawValue:
            APICaller.shared.getPopularMovies{result in
                switch result {
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        case Sections.TrendingTv.rawValue:
            APICaller.shared.getTrandingTvs{result in
                switch result {
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        case Sections.Popular.rawValue:
            APICaller.shared.getPopularMovies{result in
                switch result {
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        case Sections.Upcoming.rawValue:
            APICaller.shared.getUpcomingMovies{result in
                switch result {
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        case Sections.TopRated.rawValue:
            APICaller.shared.getTopRatedMovies{result in
                switch result {
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        default:
            return UITableViewCell()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 18,weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
        header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLatter()
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return  sectionTitle[section]
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
           let defaultOffset = view.safeAreaInsets.top
           let offset = scrollView.contentOffset.y + defaultOffset
           
           navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
       }
}
