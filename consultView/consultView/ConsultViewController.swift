//
//  ViewController.swift
//  consultView
//
//  Created by Jatin Kamal Vangani on 06/02/24.
//

import UIKit

class ConsultViewController: UIViewController {

    private let viewLabel : UILabel = {
       
        let label = UILabel()
        label.text = "How would you like to consult your doctor?"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.sizeToFit()
        label.numberOfLines = 2
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.textAlignment = .center
        return label
    }()
        
    lazy var stack: UIStackView = {
            let stackView = UIStackView(frame: self.view.bounds)
            stackView.axis = .vertical
            stackView.distribution = .fillEqually
            stackView.alignment = .center
            stackView.spacing = 15
            stackView.backgroundColor = .systemBackground
            stackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
        let videoConsultView = ConsultUIView(image: UIImage(named: "Image"), title: "Book Video Consultation", subtitle: "Consult with a doctor via video call")
        videoConsultView.backgroundColor = UIColor(hex: "#ffe6ff")
        
     
        let inclinicConsultView = ConsultUIView(image: UIImage(named: "Image1"), title: "Book In-Clinic Consultation", subtitle: "Consult with a doctor in person")
       
        inclinicConsultView.backgroundColor = UIColor(hex: "e5ffff")
      
            
            stackView.addArrangedSubview(videoConsultView)
            stackView.addArrangedSubview(inclinicConsultView)

            return stackView
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            
            stack.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(viewLabel)
            view.addSubview(stack)
            
            NSLayoutConstraint.activate([
                    viewLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
                    viewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
                    viewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
                ])
                            
            NSLayoutConstraint.activate([
                stack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                stack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                stack.topAnchor.constraint(equalTo: viewLabel.safeAreaLayoutGuide.bottomAnchor, constant: 20),
                    //stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150)
                ])
            
            print("done")
        }
}

extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}


