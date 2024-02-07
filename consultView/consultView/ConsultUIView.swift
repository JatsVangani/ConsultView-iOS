//
//  ConsultUIView.swift
//  consultView
//
//  Created by Jatin Kamal Vangani on 06/02/24.
//

import UIKit

class ConsultUIView: UIView {

    
    private let consultImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        //imageView.image = UIImage.init(named: "image1")
       
        return imageView
    }()
    
    private let titleLabel : UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.sizeToFit()
        return label
    }()
    
    private let subtitleLabel : UILabel = {
        let subLabel = UILabel()
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        subLabel.font = UIFont.systemFont(ofSize: 15)
        subLabel.textColor = .gray
        subLabel.sizeToFit()
        return subLabel
    }()
    
     init(image: UIImage?, title: String, subtitle: String) {
        
         super.init(frame: .zero)
        consultImageView.image = image
        titleLabel.text = title
        subtitleLabel.text = subtitle
        
         self.translatesAutoresizingMaskIntoConstraints = false
         

        layer.cornerRadius = 15
        
        addSubview(consultImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        
        applyConstraints()
    }
    
    
    private func applyConstraints() {
        
        let consultImageViewConstraints = [
               consultImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
               consultImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
               consultImageView.widthAnchor.constraint(equalToConstant: 80),
               consultImageView.heightAnchor.constraint(equalToConstant: 80)
           ]
           let titleLabelConstraints = [
               titleLabel.topAnchor.constraint(equalTo: consultImageView.bottomAnchor, constant: 20),
               titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
               titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
           ]
           let subtitleLabelConstraints = [
               subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
               subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
               subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
               subtitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
           ]
        
        NSLayoutConstraint.activate(consultImageViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(subtitleLabelConstraints)
        
        NSLayoutConstraint.activate([
                widthAnchor.constraint(equalToConstant: 350),
                heightAnchor.constraint(equalToConstant: 200)
            ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
