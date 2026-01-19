//
//  CartTableViewCell.swift
//  15_10_2025_AlamofireWithSPM
//
//  Created by Vishal Jagtap on 16/01/26.
//

import UIKit
import Kingfisher

class CartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cartUserIdLabel: UILabel!
    @IBOutlet weak var cartDiscountedTotalLabel: UILabel!
    @IBOutlet weak var productsCollectionView: UICollectionView!
    var reuseIdentifierForProductCollectionViewCell = "ProductCollectionViewCell"
    
    var products : [Product]?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        productsCollectionView.dataSource = self
        productsCollectionView.delegate = self
        
        let uiNIb = UINib(nibName: reuseIdentifierForProductCollectionViewCell, bundle: nil)
        self.productsCollectionView.register(uiNIb, forCellWithReuseIdentifier: reuseIdentifierForProductCollectionViewCell)
        
        DispatchQueue.main.async {
            self.productsCollectionView.reloadData()
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
}


extension CartTableViewCell : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.products!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let productCollectionViewCell = self.productsCollectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierForProductCollectionViewCell, for: indexPath) as? ProductCollectionViewCell
        
        productCollectionViewCell?.productTitleLabel.text = "\(self.products![indexPath.item].title)"
        productCollectionViewCell?.productPriceLabel.text = "\(self.products![indexPath.item].price)"
        
        let productImageUrl = URL(string: self.products![indexPath.item].thumbnail)
        productCollectionViewCell?.productImageView.kf.setImage(with: productImageUrl)
        
        return productCollectionViewCell ?? UICollectionViewCell()
    }
}


extension CartTableViewCell : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150.0, height: 150.0)
    }
}
