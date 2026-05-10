//
//  ObraDeArte.swift
//  ArtistasCuritibanos
//
//  Created by user290919 on 5/9/26.
//
import Foundation

struct ObraDeArte {
    let titulo: String
    let artista: String
    let ano: Int
    let estilo: String
    let imagemNome: String
    let descricao: String
    
}

let obrasList: [ObraDeArte] = [
    ObraDeArte(
        titulo: "Primeira Obra",
        artista: "Durival de Britto",
        ano: 2000,
        estilo: "Abstrata",
        imagemNome: "curitiba_image",
        descricao: "Que arte abstratamente abstrata"
    ),
    ObraDeArte(
        titulo: "Primeira Obra",
        artista: "Durival de Britto",
        ano: 2000,
        estilo: "Abstrata",
        imagemNome: "curitiba_image",
        descricao: "Que arte abstratamente abstrata"
    )
]
