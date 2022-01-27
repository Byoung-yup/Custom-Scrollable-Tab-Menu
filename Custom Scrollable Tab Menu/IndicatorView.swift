//
//  IndicatorView.swift
//  Custom Scrollable Tab Menu
//
//  Created by 김병엽 on 2022/01/27.
//

import UIKit

class IndicatorView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func loadNib() {
        if let view = Bundle.main.loadNibNamed("IndicatorView", owner: self, options: nil)?.first as? UIView {
            view.frame = self.bounds
            view.backgroundColor = .purple
            self.addSubview(view)
        }
    }
}
