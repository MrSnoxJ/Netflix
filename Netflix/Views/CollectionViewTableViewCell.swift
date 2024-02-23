//
//  CollectionViewTableViewCell.swift
//  Netflix
//
//  Created by Yerasyl Sharipov on 16.04.2023.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {
    
    static let idetify = "CollectionViewTableViewCell"
    
    
    private var titels: [title] = [title]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
        contentView.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    private let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        let  collectionView = UICollectionView(frame: .zero, collectionViewLayout : layout)
        collectionView .register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        return collectionView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    
    
    public func configure(with titles : [title]){
        self.titels = titles
        DispatchQueue.main.async {[weak self] in
            self?.collectionView.reloadData()
        }
    }
    
}
extension CollectionViewTableViewCell :UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else{
            return UICollectionViewCell()
        }
        guard let model = titels[indexPath.row].poster_path else{
           return UICollectionViewCell()
        }
        cell.configure(with: model)
        return  cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titels.count
    }
    
}
