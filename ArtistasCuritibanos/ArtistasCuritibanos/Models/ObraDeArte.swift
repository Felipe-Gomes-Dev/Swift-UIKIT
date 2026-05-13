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
            titulo: "Luz do Jardim Botânico",
            artista: "Poty Lazzarotto",
            ano: 1978,
            estilo: "Modernista",
            imagemNome: "poty_jardim_botanico",
            descricao: "Representação artística inspirada nas formas e na arquitetura icônica de Curitiba."
        ),
        
    ObraDeArte(
        titulo: "Terceira Obra",
        artista: "William de souza",
        ano: 2026, estilo: "Abstrata",
        imagemNome: "will_arte",
        descricao: "Que arte abstratamente abstrata"
    ),
        
        ObraDeArte(
            titulo: "Movimento Urbano",
            artista: "Eliane Prolik",
            ano: 2003,
            estilo: "Escultura Contemporânea",
            imagemNome: "movimento_urbano",
            descricao: "Exploração visual das formas humanas e do fluxo urbano de Curitiba."
        ),
        
        ObraDeArte(
            titulo: "Silêncio no Bosque",
            artista: "Fernando Velloso",
            ano: 1971,
            estilo: "Abstrata",
            imagemNome: "silencio_bosque",
            descricao: "Pintura abstrata inspirada nos bosques e parques tradicionais da cidade."
        ),
        
        ObraDeArte(
            titulo: "Cores do Centro Histórico",
            artista: "Poty Lazzarotto",
            ano: 1982,
            estilo: "Muralismo",
            imagemNome: "centro_historico_poty",
            descricao: "Arte inspirada nos murais e na arquitetura histórica do centro de Curitiba."
        )
]
