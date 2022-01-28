//
//  ViewController.swift
//  Custom Scrollable Tab Menu
//
//  Created by 김병엽 on 2022/01/20.
//

import UIKit

class ViewController: UIViewController {
    
    var tabSelectedIndex = 0
    
    var scrollView: ScrollView!
    
    let menu: [String] = ["빨간색", "주황색", "노란색", "초록색", "파란색", "보라색"]
    
    var menuCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        
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
        scrollView.scrollView.delegate = self
        self.view.addSubview(scrollView)        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.menuCollectionView.safeAreaLayoutGuide.bottomAnchor, constant: 15),
            scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
         
        
        NSLayoutConstraint.activate([
            self.menuCollectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.menuCollectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            self.menuCollectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
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
        
        if indexPath.row != tabSelectedIndex {
            cell.setStatus(name: menu[indexPath.row], isTouched: false)
        } else {
            cell.setStatus(name: menu[indexPath.row], isTouched: true)
        }
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.tabSelectedIndex = indexPath.row
        
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
        
        self.menuCollectionView.reloadData()
    }
    
}
 

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width) / 5
        let height = self.menuCollectionView.frame.height
        
        return CGSize(width: width, height: height)
    }
}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let page = Int(targetContentOffset.pointee.x / self.scrollView.frame.width)
        
        switch page {
        case 0:
            tabSelectedIndex = 0
        case 1:
            tabSelectedIndex = 1
        case 2:
            tabSelectedIndex = 2
        case 3:
            tabSelectedIndex = 3
        case 4:
            tabSelectedIndex = 4
        case 5:
            tabSelectedIndex = 5
        default :
            break
        }
        
        self.menuCollectionView.reloadData()
    }

}
