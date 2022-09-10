//
//  ContentView.swift
//  TrafficLight
//
//  Created by Denis Bokov on 10.09.2022.
//

import SwiftUI

struct ContentView: View {

    @State private var lightIsOnRed = 0.1
    @State private var lightIsOnYellow = 0.1
    @State private var lightIsOnGreen = 0.1
    
    var body: some View {
        VStack {
            Circle()
                .foregroundColor(Color(red: 0, green: 255, blue: 0, opacity: lightIsOnRed))
                .frame(width: 100, height: 100)
                .overlay(Circle().stroke())
                .shadow(color: .green, radius: 13)
            Circle()
                .foregroundColor(Color(red: 255, green: 255, blue: 0, opacity: lightIsOnYellow))
                .overlay(Circle().stroke())
                .frame(width: 100, height: 100)
                .shadow(color: .yellow, radius: 13)
            Circle()
                .foregroundColor(Color(red: 255, green: 0, blue: 0, opacity: lightIsOnGreen))
                .overlay(Circle().stroke())
                .frame(width: 100, height: 100)
                .shadow(color: .red, radius: 13)
            Spacer()
            
            Button(action: startButtonPressed) {
                changeButtonName()
                    .frame(width: 150, height: 50)
                    .foregroundColor(.white)
                    .background(Color.blue).cornerRadius(15)
            }
        }
        .padding(.top, 70)
        .padding(.bottom, 70)
    }
    
    
    private func changeButtonName() -> Text {
        if lightIsOnRed == 1.0 || lightIsOnYellow == 1.0 || lightIsOnGreen == 1.0 {
            return Text("NEXT")
        } else {
            return Text("START")
        }
    }
    
    private func startButtonPressed() {
        if lightIsOnRed < 1.0 && lightIsOnYellow < 1.0 && lightIsOnGreen < 1.0 {
            lightIsOnRed = 1.0
        } else if lightIsOnRed == 1.0 {
            lightIsOnRed = 0.1
            lightIsOnYellow = 1.0
        } else if lightIsOnYellow == 1.0 {
            lightIsOnYellow = 0.1
            lightIsOnGreen = 1.0
        } else if lightIsOnGreen == 1.0 {
            lightIsOnGreen = 0.1
            lightIsOnRed = 1.0
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
