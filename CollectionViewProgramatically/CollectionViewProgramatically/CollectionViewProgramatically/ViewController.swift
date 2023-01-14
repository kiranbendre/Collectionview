//
//  ViewController.swift
//  CollectionViewProgramatically
//
//  Created by Iphone XR on 19/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    var nameArray = ["Anjali Bendre","Kiran Bendre","Pratibha Bendre","Nirmala Doke","Chhaya Doke","Dipali Sutar","Sonali Bade"]
    var addressArray = ["Pune","Bhosari","Shirur","Hadapsar","Nigadi","Baner","Nagar"]
    var profileImages = ["Image1","Image2","Image3","Image4","Image5","Image6","Image7"]
    
  private var collectionView:UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: 400, height: 200)
        collectionView = UICollectionView(frame:  CGRect(x: 0, y: 50, width: 1600, height: 900), collectionViewLayout: layout)
        
        guard let collectionView = collectionView else{
            return
        }
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCollectionViewCell.identifier")
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
       
        }
    }
extension ViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell.identifier", for: indexPath)as! CustomCollectionViewCell
        
        cell.nameLabel.text = self.nameArray[indexPath.item]
        cell.addressLabel.text = self.addressArray[indexPath.item]
        cell.profileImage.image = UIImage(named:profileImages[indexPath.row])
        return cell
    }
}
extension ViewController:UICollectionViewDelegate{
    
}
extension ViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width - 10/1)
        return CGSize(width:300, height: 100)
    }
}

class CustomCollectionViewCell: UICollectionViewCell {
    
  static let identifier = "CustomCollectionViewCell"
    
    var nameLabel:UILabel!
    var addressLabel:UILabel!
    var profileImage = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        
        nameLabel = UILabel()
        nameLabel.textColor = UIColor.black
        nameLabel.font = UIFont.systemFont(ofSize: 17)
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: nameLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 20).isActive = true
        NSLayoutConstraint(item: nameLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 20).isActive = true
        NSLayoutConstraint(item: nameLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -20).isActive = true
        
        addressLabel = UILabel()
        addressLabel.textColor = UIColor.black
        addressLabel.font = UIFont.systemFont(ofSize: 17)
        addSubview(addressLabel)
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: addressLabel, attribute: .top, relatedBy: .equal, toItem: nameLabel, attribute: .bottom, multiplier: 1.0, constant: 10).isActive = true
        NSLayoutConstraint(item: addressLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 20).isActive = true
        NSLayoutConstraint(item: addressLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -20).isActive = true
        
        //create imageview
            
        profileImage.contentMode = UIView.ContentMode.scaleAspectFit
       
        addSubview(profileImage)
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: profileImage, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 7).isActive = true
        NSLayoutConstraint(item: profileImage, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 28).isActive = true
      NSLayoutConstraint(item: profileImage, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1.0, constant: 200).isActive = true
        NSLayoutConstraint(item: profileImage, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1.0, constant: -17).isActive = true
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
