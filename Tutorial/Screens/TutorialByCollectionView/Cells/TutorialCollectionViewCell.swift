//
//  TutorialCollectionViewCell.swift
//  PostsApp
//
//  Created by Hà Văn Đức on 18/05/2023.
//

import UIKit

class TutorialCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var tutorialImage: UIImageView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var descLb: UILabel!
    @IBOutlet weak var titleLb: UILabel!
    
    var nextCallback: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nextBtn.setTitle("Skip", for: .normal)
        tutorialImage.image = nil
        titleLb.text = nil
        descLb.text = nil
        
        nextBtn.layer.borderWidth = 1
        nextBtn.layer.borderColor = UIColor(red: 0.004, green: 0.69, blue: 0.945, alpha: 1).cgColor
        nextBtn.setTitleColor(UIColor(red: 0.004, green: 0.69, blue: 0.945, alpha: 1), for: .normal)
        nextBtn.layer.cornerRadius = 5
        nextBtn.clipsToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        tutorialImage.image = nil
        titleLb.text = nil
        descLb.text = nil
    }
    
    @IBAction func handleButtonAction(_ sender: UIButton) {
        nextCallback?()
    }
    
    func bindData(index: Int, image: String, title: String, desc: String, nextCallback: (() -> Void)?) {
        if index == 2 {
            nextBtn.setTitle("Start", for: .normal)
        } else {
            nextBtn.setTitle("Skip", for: .normal)
        }
        
        self.nextCallback = nextCallback
        tutorialImage.image = UIImage(named: image)
        titleLb.text = title
        descLb.text = desc
    }
}
