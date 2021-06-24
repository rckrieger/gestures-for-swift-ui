//
//  ContentView.swift
//  gestures for swift ui
//
//  Created by Rebecca Krieger on 6/23/21.
//

import SwiftUI

class GlobalString: ObservableObject {
  @Published var SensedGesture = ""
}

struct ContentView: View {
    @StateObject var sensed = GlobalString()

    var body: some View {
        let basicTap = TapGesture()
            .onEnded {sensed.SensedGesture = "basic tap"}
        
                
        VStack{
        Text("Gesture Recognizer saw")
            .padding()
        Text(sensed.SensedGesture)
        Image(systemName: "star.fill")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200).foregroundColor(.red)
            .gesture(basicTap)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
