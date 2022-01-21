//
//  ViewController.swift
//  Custom Scrollable Tab Menu
//
//  Created by 김병엽 on 2022/01/20.
//

import UIKit

class ViewController: UIViewController {
    
    var scrollView: ScrollView!
    
    let menu: [String] = ["빨간색", "주황색", "노란색", "초록색", "파란색", "보라색"]
    
    var menuCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.layer.borderWidth = 0.2
        cv.layer.borderColor = UIColor.red.cgColor
        
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.menuCollectionView.delegate = self
        self.menuCollectionView.dataSource = self
        self.setUpLayout()
        self.registerNib()
    }
    
    func setUpLayout() {
        self.view.addSubview(menuCollectionView)
        self.menuCollectionView.translatesAutoresizingMaskIntoConstraints = false

        self.scrollView = ScrollView()
        self.view.addSubview(scrollView)        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.menuCollectionView.safeAreaLayoutGuide.bottomAnchor, constant: 30),
            scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
         
        
        NSLayoutConstraint.activate([
            self.menuCollectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.menuCollectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.menuCollectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.menuCollectionView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func registerNib() {
        let nib = UINib(nibName: "MenuCell", bundle: Bundle.main)
        self.menuCollectionView.register(nib, forCellWithReuseIdentifier: "MenuCell")
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.menu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! MenuCell
        cell.lbl.text = self.menu[indexPath.row]
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.scrollView.scrollView.setContentOffset(CGPoint.zero, animated: true)
        case 1:
            self.scrollView.scrollView.setContentOffset(CGPoint(x: self.scrollView.frame.width, y: 0), animated: true)
        case 2:
            self.scrollView.scrollView.setContentOffset(CGPoint(x: self.scrollView.frame.width * 2, y: 0), animated: true)
        case 3:
            self.scrollView.scrollView.setContentOffset(CGPoint(x: self.scrollView.frame.width * 3, y: 0), animated: true)
        case 4:
            self.scrollView.scrollView.setContentOffset(CGPoint(x: self.scrollView.frame.width * 4, y: 0), animated: true)
        case 5:
            self.scrollView.scrollView.setContentOffset(CGPoint(x: self.scrollView.frame.width * 5, y: 0), animated: true)
        default :
            break
        }
    }
    
}
 

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.menuCollectionView.frame.width) / 5
        let height = self.menuCollectionView.frame.height
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
}
