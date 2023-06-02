//
//  TutorialViewController.swift
//  PostsApp
//
//  Created by Hà Văn Đức on 31/05/2023.
//

import UIKit

class TutorialViewController: UIViewController {
    @IBOutlet weak private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    /**
     Cách 2: Sử dụng code
     */
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            
            flowLayout.minimumLineSpacing = 0
            flowLayout.minimumInteritemSpacing = 0
            flowLayout.sectionInset = .zero
            
            flowLayout.scrollDirection = .vertical
            
            flowLayout.estimatedItemSize = .zero
            flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        }
        
//        let CellID = "ItemSection1CollectionViewCell"
//        let nib = UINib(nibName: CellID, bundle: nil)
//        collectionView.register(nib, forCellWithReuseIdentifier: CellID)
        collectionView.register(UINib(nibName: "ItemSection1CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ItemSection1CollectionViewCell")
        
        collectionView.register(UINib(nibName: "ItemSection2CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ItemSection2CollectionViewCell")
        
        
    }
}

extension TutorialViewController: UICollectionViewDataSource {
    /**
     Mặc định thằng này sẽ là 1
     Định nghĩa số section trong 1 collectionview
     */
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3/// Section 0, 1, 2
    }
    
    /**
     Định nghĩa số item trong 1 section
     */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 10
        case 1:
            return 20
        case 2:
            return 0
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let section = indexPath.section
        switch section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemSection1CollectionViewCell", for: indexPath) as? ItemSection1CollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.backgroundTestView.backgroundColor = .red
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemSection2CollectionViewCell", for: indexPath) as! ItemSection2CollectionViewCell
            cell.testLb.text = "Dòng số \(indexPath.row)"
            return cell
        case 2:
            return UICollectionViewCell()
        default:
            return UICollectionViewCell()
        }
    }
}

extension TutorialViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Section \(indexPath.section) row: \(indexPath.row)")
    }
}
