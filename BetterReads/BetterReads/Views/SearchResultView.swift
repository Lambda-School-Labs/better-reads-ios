//
//  SearchResultView.swift
//  BetterReads
//
//  Created by Jorge Alvarez on 4/20/20.
//  Copyright © 2020 Labs23. All rights reserved.
//

import UIKit

class SearchResultView: UIView {

    // FIXME: make sure image fills up imageView nicely (aspectFit vs Fill etc..)
    var imageView: UIImageView!

    var titleLabel: UILabel! // var title = uilabel()
    var authorLabel: UILabel!
    var ratingView: UILabel! // FIXME: change back to uiview
    
    var standardMargin: CGFloat = CGFloat(16.0)
    
    private let titleFont = UIFont.systemFont(ofSize: 24.0, weight: .semibold)
    private let authorFont = UIFont.systemFont(ofSize: 16.0, weight: .semibold)
    private let authorTextColor = UIColor(red: 100.0/255.0, green: 100.0/255.0, blue: 100.0/255.0, alpha: 1.0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpSubviews()
    }
    
    private func setUpSubviews() {
        backgroundColor = .white
        
        // Image View
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        self.imageView = imageView
        imageView.backgroundColor = UIColor(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1.0)
        
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: standardMargin).isActive = true
        imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.5).isActive = true
        
        // Title Label
        let label = UILabel()
        addSubview(label)
        self.titleLabel = label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        //titleLabel.backgroundColor = .gray
        titleLabel.font = titleFont
        // constraints
        titleLabel.topAnchor.constraint(equalTo: imageView.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: standardMargin).isActive = true
        
        // Author Label
        let author = UILabel()
        addSubview(author)
        self.authorLabel = author
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.textColor = authorTextColor
        authorLabel.font = authorFont
        
        authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: standardMargin * 0.25).isActive = true
        authorLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: standardMargin).isActive = true
        
        // Rating View (stack view of image views?)
        let rating = UILabel()
        addSubview(rating)
        self.ratingView = rating
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        //ratingView.backgroundColor = .systemBlue
        ratingView.text = "★★★★★"
        ratingView.textColor = .systemBlue
        ratingView.font = UIFont.systemFont(ofSize: 24.0, weight: .regular)

        
        ratingView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor).isActive = true
        // pushed to left by 1 so star point lines up with author name (and so I don't wake up screaming at night)
        ratingView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: standardMargin - 1.0).isActive = true
        
        
    }

}