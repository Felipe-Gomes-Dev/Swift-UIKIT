//
//  ViewController.swift
//  ArtistasCuritibanos
//
//  Created by user290919 on 5/9/26.
//

import UIKit


class ViewController: UIViewController,
UICollectionViewDataSource,
UICollectionViewDelegate
{
    @IBOutlet weak var collectionView: UICollectionView!
    
    let obras = obrasList
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Artistas Curitibanos"
//        collectionView.dataSource = self
//        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return obrasList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

//        return UICollectionViewCell()
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
               cell.backgroundColor = .white  // deixa visível
               cell.layer.borderWidth = 1     // opcional: borda para ver melhor
               cell.layer.borderColor = UIColor.gray.cgColor
               return cell
    }
}
	
