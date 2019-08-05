//
//  ViewController.swift
//  MVC
//
//  Created by Hai on 24/07/19.
//  Copyright © 2019 Asep Abdaz. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController ,UICollectionViewDelegateFlowLayout{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("Coders")
        navigationItem.title = "Home"
        print("Test")
        
        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(VideoClass.self, forCellWithReuseIdentifier: "callid")
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "callid", for: indexPath)
        
//        cell.backgroundColor = UIColor.red
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}
class VideoClass: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let sparatorView:  UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupViews() {

        //Menambahkan image view thumbnail
//        addSubview(thumbnailImageView)
//        let thumnailImageViewConstrains: [NSLayoutConstraint] = [
//            thumbnailImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
//            thumbnailImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
//            thumbnailImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
//            thumbnailImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10)
//
//        ]
//        NSLayoutConstraint.activate(thumnailImageViewConstrains)
        
        addSubview(thumbnailImageView)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": thumbnailImageView]))
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[v0]-16-[v1(1)]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": thumbnailImageView,"v1": sparatorView]))
        addSubview(sparatorView)

        
        ///ext
        
        addConstraintWithFormat(format: "V:|-16-[v0]-16-[v1(1)]|", views: thumbnailImageView, sparatorView)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": sparatorView]))
        

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension UIView{
    func addConstraintWithFormat(format: String, views: UIView... ){
        
        var viewDictonary = [String: UIView]()
        
        for (index,view) in views.enumerated() {
            let key = "v\(index)"
            viewDictonary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewDictonary))
    }
}
