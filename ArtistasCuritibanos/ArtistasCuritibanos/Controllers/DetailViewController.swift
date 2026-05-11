//
//  DetailViewController.swift
//  ArtistasCuritibanos
//
//  Created by user290919 on 5/10/26.
//

import UIKit

class DetailViewController: UIViewController {
    var obra: ObraDeArte?

    @IBOutlet weak var obraImageView: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var artistaLabel: UILabel!
    @IBOutlet weak var anoLabel: UILabel!
    @IBOutlet weak var estiloLabel: UILabel!
    @IBOutlet weak var descricaoTextView: UITextView!
    
    @IBOutlet weak var compartilharButton: UIButton!

    @IBAction func compartilharButton(_ sender: UIButton) {
        guard let obra = obra else { return }

        let mensagem = """
        Conheça a obra "\(obra.titulo)" do artista \(obra.artista)!
        Veja mais obras no app Artistas Curitibanos.
        """

        let activityViewController = UIActivityViewController(
            activityItems: [mensagem],
            applicationActivities: nil
        )

        present(activityViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let obra = obra {

            obraImageView.image = UIImage(named: obra.imagemNome)

            artistaLabel.text = obra.artista

            anoLabel.text = "Ano: \(obra.ano)"

            estiloLabel.text = "Estilo: \(obra.estilo)"

            descricaoTextView.text = obra.descricao

            title = obra.titulo
            
            compartilharButton.setTitle("Compartilhar", for: .normal)
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
