//
//  DetailViewController.swift
//  ArtistasCuritibanos
//
//  Created by user290919 on 5/10/26.
//

import UIKit

final class DetailViewController: UIViewController {
    var obra: ObraDeArte?

    private let mainScrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.alwaysBounceVertical = true
        return sv
    }()

    private let contentView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    private let verticalStack: UIStackView = {
        let s = UIStackView()
        s.translatesAutoresizingMaskIntoConstraints = false
        s.axis = .vertical
        s.spacing = 12
        s.alignment = .fill
        s.distribution = .fill
        return s
    }()

    private let obraImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.backgroundColor = .secondarySystemBackground
        return iv
    }()

    private let tituloLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = .preferredFont(forTextStyle: .title2)
        l.textAlignment = .center
        l.numberOfLines = 0
        l.adjustsFontForContentSizeCategory = true
        return l
    }()

    private let artistaLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = .preferredFont(forTextStyle: .headline)
        l.textAlignment = .center
        l.numberOfLines = 0
        l.adjustsFontForContentSizeCategory = true
        return l
    }()

    private let metaRowStack: UIStackView = {
        let s = UIStackView()
        s.translatesAutoresizingMaskIntoConstraints = false
        s.axis = .horizontal
        s.spacing = 8
        s.alignment = .firstBaseline
        s.distribution = .fillEqually
        return s
    }()

    private let estiloLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = .preferredFont(forTextStyle: .body)
        l.textColor = UIColor(red: 0.02, green: 0.49, blue: 1.0, alpha: 1)
        l.numberOfLines = 0
        l.adjustsFontForContentSizeCategory = true
        return l
    }()

    private let anoLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = .preferredFont(forTextStyle: .body)
        l.textAlignment = .natural
        l.numberOfLines = 0
        l.adjustsFontForContentSizeCategory = true
        if let accent = UIColor(named: "AccentColor") {
            l.textColor = accent
        } else {
            l.textColor = .tintColor
        }
        return l
    }()

    private let descricaoTextView: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.isScrollEnabled = false
        tv.isEditable = false
        tv.font = .preferredFont(forTextStyle: .body)
        tv.backgroundColor = .clear
        tv.textContainerInset = .zero
        tv.textContainer.lineFragmentPadding = 0
        tv.adjustsFontForContentSizeCategory = true
        tv.setContentCompressionResistancePriority(.required, for: .vertical)
        return tv
    }()

    private let compartilharButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Compartilhar"
        config.baseForegroundColor = UIColor(red: 0.96, green: 0.92, blue: 0.85, alpha: 1)
        config.baseBackgroundColor = UIColor(red: 0.02, green: 0.49, blue: 1, alpha: 1)
        config.cornerStyle = .medium
        let b = UIButton(configuration: config)
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        buildLayout()
        compartilharButton.addTarget(self, action: #selector(compartilharTapped), for: .touchUpInside)
        applyObraData()
    }

    private func buildLayout() {
        view.addSubview(mainScrollView)
        view.addSubview(compartilharButton)
        mainScrollView.addSubview(contentView)
        contentView.addSubview(verticalStack)

        metaRowStack.addArrangedSubview(estiloLabel)
        metaRowStack.addArrangedSubview(anoLabel)

        verticalStack.addArrangedSubview(obraImageView)
        verticalStack.addArrangedSubview(tituloLabel)
        verticalStack.addArrangedSubview(artistaLabel)
        verticalStack.addArrangedSubview(metaRowStack)
        verticalStack.addArrangedSubview(descricaoTextView)

        let contentG = mainScrollView.contentLayoutGuide
        let frameG = mainScrollView.frameLayoutGuide
        let safe = view.safeAreaLayoutGuide
        let bottomSpacing: CGFloat = 16
        let buttonTopSpacing: CGFloat = 12

        NSLayoutConstraint.activate([
            mainScrollView.topAnchor.constraint(equalTo: safe.topAnchor),
            mainScrollView.leadingAnchor.constraint(equalTo: safe.leadingAnchor),
            mainScrollView.trailingAnchor.constraint(equalTo: safe.trailingAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: compartilharButton.topAnchor, constant: -buttonTopSpacing),

            compartilharButton.leadingAnchor.constraint(equalTo: safe.leadingAnchor, constant: 16),
            compartilharButton.trailingAnchor.constraint(equalTo: safe.trailingAnchor, constant: -16),
            compartilharButton.bottomAnchor.constraint(equalTo: safe.bottomAnchor, constant: -bottomSpacing),
            compartilharButton.heightAnchor.constraint(greaterThanOrEqualToConstant: 44),

            contentView.leadingAnchor.constraint(equalTo: contentG.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: contentG.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: contentG.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: contentG.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: frameG.widthAnchor),

            verticalStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            verticalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            verticalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            verticalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),

            obraImageView.heightAnchor.constraint(equalTo: obraImageView.widthAnchor, multiplier: 9.0 / 16.0),
        ])
    }

    private func applyObraData() {
        guard let obra else { return }

        obraImageView.image = UIImage(named: obra.imagemNome)
        tituloLabel.text = obra.titulo
        artistaLabel.text = obra.artista
        anoLabel.text = "Ano: \(obra.ano)"
        estiloLabel.text = "Estilo: \(obra.estilo)"
        descricaoTextView.text = obra.descricao
        title = obra.titulo
    }

    @objc private func compartilharTapped() {
        guard let obra else { return }

        let mensagem = """
        Conheça a obra "\(obra.titulo)" do artista \(obra.artista)!
        Veja mais obras no app Artistas Curitibanos.
        """

        let activityViewController = UIActivityViewController(
            activityItems: [mensagem],
            applicationActivities: nil
        )

        if let pop = activityViewController.popoverPresentationController {
            pop.sourceView = compartilharButton
            pop.sourceRect = compartilharButton.bounds
        }

        present(activityViewController, animated: true)
    }
}
