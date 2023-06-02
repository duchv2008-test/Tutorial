//
//  TutorialByCollectionView.swift
//  PostsApp
//
//  Created by Hà Văn Đức on 18/05/2023.
//

import UIKit

private let reuseIdentifier = "TutorialCollectionViewCell"

struct Tutorial {
    var imageName: String
    var title: String
    var desc: String
}

class TutorialByCollectionView: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    private var dataSource = [Tutorial]()
    private var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.estimatedItemSize = .zero
            
        }
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        
        self.collectionView!.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
        dataSource = [
            Tutorial(imageName: "tutorial_1",
                     title: "Welcome to Techmaster",
                     desc: "Học là có việc"),
            Tutorial(imageName: "tutorial_2",
                     title: "Lớp iOS nâng cao - iOS 08",
                     desc: "Học vì đam mê"),
            Tutorial(imageName: "tutorial_3",
                     title: "Nâng cao giá trị bản thân",
                     desc: "Hãy làm những gì mình thích"),
        ]
        collectionView.reloadData()
    }
    
    private func routeToAuthNavigation() {
        print("Go to login screen")
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TutorialCollectionViewCell
        let tutorialModel = dataSource[indexPath.row]
        
        cell.bindData(index: indexPath.row,
                      image: tutorialModel.imageName,
                      title: tutorialModel.title,
                      desc: tutorialModel.desc) { [weak self] in
            guard let self = self else { return }
            if indexPath.row + 1 == 3 {
                // go to login
                self.routeToAuthNavigation()
            } else {
                self.currentPage = indexPath.row + 1
                collectionView.scrollToItem(at: IndexPath(item: self.currentPage, section: 0), at: .centeredHorizontally, animated: true)
            }
        }
        return cell
    }

    // MARK: UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}
