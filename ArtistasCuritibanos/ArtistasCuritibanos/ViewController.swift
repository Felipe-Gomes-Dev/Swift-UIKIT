//
//  ViewController.swift
//  ArtistasCuritibanos
//
//  Created by user290919 on 5/9/26.
//

import UIKit


class ViewController: UIViewController,
UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout
{
    @IBOutlet weak var collectionView: UICollectionView!
    
    let obras = obrasList
    var obraSelecionada: ObraDeArte?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Artistas Curitibanos"
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return obrasList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let obra = obras[indexPath.row]

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "ObraCell",
            for: indexPath
        ) as! ObraCollectionViewCell

        cell.tituloLabel.text = obra.titulo
        cell.artistaLabel.text = obra.artista
        cell.obraImageView.image = UIImage(named: obra.imagemNome)
        cell.obraImageView.clipsToBounds = true
        cell.layer.cornerRadius = 12
        cell.layer.masksToBounds = true

        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        obraSelecionada = obras[indexPath.row]

        performSegue(withIdentifier: "ShowDetailSegue", sender: nil)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {

        let largura = collectionView.frame.width

        let isIpad = UIDevice.current.userInterfaceIdiom == .pad

        let espacamento: CGFloat = 16

        let colunas: CGFloat = isIpad ? 2 : 1

        let larguraCelula = (largura - (espacamento * (colunas + 1))) / colunas

        return CGSize(width: larguraCelula, height: 260)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "ShowDetailSegue" {

            let destino = segue.destination as! DetailViewController

            destino.obra = obraSelecionada
        }
    }
}
	
