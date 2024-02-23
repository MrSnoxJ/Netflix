//
//  TitleTableViewCell.swift
//  Netflix
//
//  Created by Yerasyl Sharipov on 19.04.2023.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    static let idetifier  = "TitleTableViewCell"
    
    
    private let playButton : UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "play.circle",withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    private let titleLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    private let titlesPosterUIImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titlesPosterUIImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playButton)
        
        
        applyConstraints()
        
    }
    private func applyConstraints(){
        let titlesPosterUIImageViewConstrains = [
            titlesPosterUIImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlesPosterUIImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            titlesPosterUIImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant:  -10),
            titlesPosterUIImageView.widthAnchor.constraint(equalToConstant: 100)
            
            
        ]
        
        
        let titleLabelConstrains = [
            titleLabel.leadingAnchor.constraint(equalTo: titlesPosterUIImageView.trailingAnchor,constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        
        ]
        
        let playTitleButtonConstains = [
            playButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant:  -20),
            playButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        
        ]
        
        NSLayoutConstraint.activate(titlesPosterUIImageViewConstrains)
        NSLayoutConstraint.activate(titleLabelConstrains)
        NSLayoutConstraint.activate(playTitleButtonConstains)
    }
    public func configure (with model : TitleViewModel){
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {
            return
        }
        
        titlesPosterUIImageView.sd_setImage(with: url,completed : nil)
        titleLabel.text = model.titleName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
