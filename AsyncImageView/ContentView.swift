//
//  ContentView.swift
//  AsyncImageView
//
//  Created by Developer on 24/08/2022.
//

import SwiftUI

extension Image {
    
    func imageModifier()-> some View {
        self
            .resizable()
            .scaledToFit()
    }
}

extension Image {
    func placeHolderModifier()-> some View {
            imageModifier()
            .foregroundColor(.purple)
            .frame(maxWidth: 120)
            .opacity(0.5)
    }
}

struct ContentView: View {
    private let imageUrl:String = "https://credo.academy/credo-academy@3x.png"
    var body: some View {
    // MARK:- 1 Basics
        
      // AsyncImage(url: URL(string: imageUrl))
        
    // MARK:- 2 Scale
        
       // AsyncImage(url: URL(string: imageUrl), scale: 3.0)
        
        // MARK:- 3 Placeholder
        
//        AsyncImage(url: URL(string: imageUrl)) { Image in
//            Image.imageModifier()
//
//        } placeholder: {
//            Image(systemName: "photo.circle.fill").iconModifier()
//
//
//        }
//        .padding(40)
        
        // MARK:- 4 Failure, success, empty
        
//        AsyncImage(url: URL(string: imageUrl)) { phase in
//            switch phase {
//            case.success(let image):
//                image.imageModifier()
//            case.failure(_):
//                Image(systemName: "ant.circle.fill").placeHolderModifier()
//            case.empty:
//                Image(systemName: "photo.circle.fill").placeHolderModifier()
//
//            @unknown default:
//                fatalError()
//            }
//
//        }
        
        // MARK:- 5 Animation
        AsyncImage(url: URL(string: imageUrl),transaction: .init(animation: .spring(response: 0.5, dampingFraction: 1.0, blendDuration: 0.3))) { phase in
            switch phase {
            case.success(let image):
                image.imageModifier()
                   // .transition(.move(edge: .bottom))
                    .transition(.slide)
            case.failure(_):
                Image(systemName: "ant.circle.fill").placeHolderModifier()
            case.empty:
                Image(systemName: "photo.circle.fill").placeHolderModifier()
                
            @unknown default:
                fatalError()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
