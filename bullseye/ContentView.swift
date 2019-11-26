//
//  ContentView.swift
//  bullseye
//
//  Created by Jaykang Heo on 11/23/19.
//  Copyright © 2019 Jaykang Heo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0
    @State var target: Int = Int.random(in: 1...100)
    
    func pointsForCurrentRound() -> Int{
        
        var difference: Int
        var roundedValue: Int = Int(sliderValue.rounded())
        difference = abs(target - roundedValue)
        var awardedPoints: Int = 100 - difference
        return awardedPoints
    }
    
    var body: some View {
        VStack {
            // target row
            HStack {
                Text("bullseye")
                Text(/*@START_MENU_TOKEN@*/"100"/*@END_MENU_TOKEN@*/)
            }
            // target row
            HStack{
                Text("target \(self.target)")
            }
            
            //slider
            HStack {
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
            }
            //button row
            Button(action: {
                self.alertIsVisible = true
            }) {
                Spacer()
                Text(/*@START_MENU_TOKEN@*/"Hit Me"/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            .alert(isPresented: $alertIsVisible){() ->
                Alert in
                var roundedValue: Int = Int(round(self.sliderValue))
                return Alert(title: Text("Hello World"), message: Text("A ha: \(roundedValue)."), dismissButton: .default(Text("Awesome")) {
                    
                    })
            }
            
            // score row
            HStack {
                Text("Start Over")
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
