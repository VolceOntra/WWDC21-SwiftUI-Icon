//
//  AppleIcon.swift
//  FancyPageNavigation
//
//  Created by Manar Alhamdy on 5/30/21.
//

import SwiftUI
import PlaygroundSupport

struct AppleIcon: View {
    private let name = "applelogo"
    var image: AnyView!
    
    init(){
        self.image = AnyView(createImage())
    }
    
    func createImage()-> some View {
        Image(systemName: name)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
    
    func iconBackground() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 80)
                
                .fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color(white: 0.95)]), startPoint: .leading, endPoint: .trailing))
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0.0, y: 0.0)
            
            RoundedRectangle(cornerRadius: 80)
                .stroke(Color.gray.opacity(0.25), lineWidth: 1)
        }
    }
    
    func logoColors() -> some View {
        VStack(spacing: 0) {
            Color(#colorLiteral(red: 0.3814795017, green: 0.7336645722, blue: 0.2724335492, alpha: 1).cgColor)
                .frame(height: 130)
            Color(#colorLiteral(red: 0.9916884303, green: 0.7184842229, blue: 0.1472137272, alpha: 1).cgColor)
            Color(#colorLiteral(red: 0.9590840936, green: 0.5049895644, blue: 0.1119390801, alpha: 1).cgColor)
            Color(#colorLiteral(red: 0.8786873221, green: 0.2208179832, blue: 0.2382356226, alpha: 1).cgColor)
            Color(#colorLiteral(red: 0.5875988603, green: 0.2370037735, blue: 0.5976749659, alpha: 1).cgColor)
            Color(#colorLiteral(red: 0.006981427316, green: 0.6128490567, blue: 0.8565220237, alpha: 1).cgColor)
        }
    }
    
    var body: some View {
        ZStack {
            
            iconBackground()
            
            // Icon background blur
            image
                .frame(width: 500, height: 500, alignment: .center)
                .overlay(logoColors())
                .mask(image)
                .blur(radius: 50)
                .opacity(0.45)
            
            
            VStack(spacing: 35) {
                ZStack {
                    
                    // Left light shadow
                    image
                        .frame(width: 350, height: 350, alignment: .center)
                        .foregroundColor(.white)
                        .overlay(logoColors())
                        .mask(image                            .aspectRatio(contentMode: .fit)
                                .frame(width: 350, height: 350, alignment: .center))
                        .shadow(color: Color.white.opacity(0.55), radius: 10, x: -40.0, y: -20.0)
                        .blendMode(.softLight)
                    
                    
                    // Right blur
                    image
                        .frame(width: 350, height: 350, alignment: .center)
                        .foregroundColor(.white)
                        .overlay(logoColors())
                        .mask(image.frame(width: 350, height: 350, alignment: .center))
                        .blur(radius: 15)
                        .offset(x: 5, y: 10.0)
                        .opacity(0.7)
                    
                    // Apple Logo Border
                    image
                        .frame(width: 350, height: 350, alignment: .center)
                        .foregroundColor(.white)
                        .shadow(color: .white.opacity(0.5), radius: 1, x: 0, y: 0)
                    // Apple Logo
                    image
                        .frame(width: 350, height: 350, alignment: .center)
                        .foregroundColor(.white)
                        .overlay(logoColors())
                        .mask(image
                                .frame(width: 350, height: 350, alignment: .center))
                        .shadow(color: .black.opacity(0.15), radius: 20, x: 15.0, y: 20.0)
                    
                    
                    // Blend overlay
                    image
                        .frame(width: 350, height: 350, alignment: .center)
                        .foregroundColor(.white)
                        .overlay(logoColors())
                        .mask(image.frame(width: 350, height: 350, alignment: .center))
                        .blur(radius: 20)
                        .blendMode(.overlay)
                        .opacity(0.35)
                    
                    
                }
                Text("WWDC")
                    .bold()
                    .font(.system(size: 60))
                    +
                    Text("21")
                    .font(.system(size: 60, weight: .light))
                
            }
            
        }.frame(width: 512, height: 512)
    }
}

struct Preview: View {
    var body: some View {
        VStack(spacing: 30) {
            AppleIcon()
            Text("By Manar Alhamdy").bold()
        }.frame(width: 700, height: 700)
    }
}


PlaygroundPage.current.setLiveView(Preview())
