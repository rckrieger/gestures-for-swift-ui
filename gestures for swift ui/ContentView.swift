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
        let doubleTap = TapGesture(count: 2)
            .onEnded {sensed.SensedGesture = "double tap"}
        
        VStack{
        Text("Gesture Recognizer saw")
            .padding()
        Text(sensed.SensedGesture)
        Image(systemName: "star.fill")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200).foregroundColor(.red)
            .gesture(doubleTap)
            .onLongPressGesture {
                sensed.SensedGesture = "long press"
            }
            .onTapGesture {
                sensed.SensedGesture = "basic tap"
            }
            .gesture(MagnificationGesture()
                .onChanged{_ in sensed.SensedGesture = "Magnification changing"}
                .onEnded{_ in sensed.SensedGesture = "Magnification changed"}
            )
            .gesture(RotationGesture()
                .onEnded{_ in sensed.SensedGesture = "rotated"})
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
