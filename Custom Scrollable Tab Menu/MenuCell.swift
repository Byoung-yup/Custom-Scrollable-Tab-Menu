//
//  MenuCell.swift
//  Custom Scrollable Tab Menu
//
//  Created by 김병엽 on 2022/01/20.
//

import UIKit

class MenuCell: UICollectionViewCell {
    
    let lbl: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.textAlignment = .center
        lbl.layer.borderWidth = 0.2
        lbl.layer.borderColor = UIColor.red.cgColor
        
        return lbl
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("init frame")
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)

        self.addSubview(lbl)
        self.lbl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.lbl.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.lbl.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.lbl.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.lbl.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
    func setStatus(name: String, isTouched: Bool) {
        self.lbl.textColor = isTouched ? .purple : .darkGray
        self.lbl.text = name
    }
}
