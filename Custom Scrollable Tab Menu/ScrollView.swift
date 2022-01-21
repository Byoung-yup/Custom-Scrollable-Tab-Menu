//
//  ScrollView.swift
//  Custom Scrollable Tab Menu
//
//  Created by 김병엽 on 2022/01/20.
//

import UIKit

class ScrollView: UIView {
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let contentView: UIView = {
        let cv = UIView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let redView: UIView = {
        let v = UIView()
        v.backgroundColor = .red
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let orangeView: UIView = {
        let v = UIView()
        v.backgroundColor = .orange
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let yellowView: UIView = {
        let v = UIView()
        v.backgroundColor = .yellow
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let greenView: UIView = {
        let v = UIView()
        v.backgroundColor = .green
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let blueView: UIView = {
        let v = UIView()
        v.backgroundColor = .blue
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let purpleView: UIView = {
        let v = UIView()
        v.backgroundColor = .purple
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadNib()
        self.setDelegate()
        self.setUpInScrollView()
       
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    func loadNib() {
        if let view = Bundle.main.loadNibNamed("ScrollView", owner: self, options: nil)?.first as? UIView {
            view.frame = self.bounds
            self.addSubview(view)
        }
    }
    
    func setUpInScrollView() {
        contentView.addSubview(redView)
        contentView.addSubview(orangeView)
        contentView.addSubview(yellowView)
        contentView.addSubview(greenView)
        contentView.addSubview(blueView)
        contentView.addSubview(purpleView)
        scrollView.addSubview(contentView)
        addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            redView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            redView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            redView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/6, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            orangeView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            orangeView.leadingAnchor.constraint(equalTo: redView.trailingAnchor, constant: 40),
            orangeView.widthAnchor.constraint(equalTo: redView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            yellowView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            yellowView.leadingAnchor.constraint(equalTo: orangeView.trailingAnchor, constant: 40),
            yellowView.widthAnchor.constraint(equalTo: redView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            greenView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            greenView.leadingAnchor.constraint(equalTo: yellowView.trailingAnchor, constant: 40),
            greenView.widthAnchor.constraint(equalTo: redView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            blueView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            blueView.leadingAnchor.constraint(equalTo: greenView.trailingAnchor, constant: 40),
            blueView.widthAnchor.constraint(equalTo: redView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            purpleView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            purpleView.leadingAnchor.constraint(equalTo: blueView.trailingAnchor, constant: 40),
            purpleView.widthAnchor.constraint(equalTo: redView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor, multiplier: 6/1)
        ])
        
        
        
    }
}

extension ScrollView: UIScrollViewDelegate {
    func setDelegate() {
        scrollView.delegate = self
    }
}
