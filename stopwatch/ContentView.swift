//
//  ContentView.swift
//  stopwatch
//
//  Created by Swapnil Kumbhar on 2022-05-13.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var stopwatch = Stopwatch();
    @State var laps = [String]();
    
    var body: some View {
        ScrollView {
            VStack(
                   alignment: .leading,
                   spacing: 0
               ) {
                   Text(stopwatch.time)
                       .font(.largeTitle)
                       .fontWeight(.bold)
                       .padding(20)
                       .frame(maxWidth: .infinity)
                       .frame(height: 200)
                   HStack {
                       Button(action: {
                           if stopwatch.is_started
                           {
                               stopwatch.stop();
                           }
                           else
                           {
                               stopwatch.start();
                               laps.removeAll();
                           }
                       }) {
                           Text(stopwatch.is_started ? "Stop" : "Start").foregroundColor(Color.white).frame(maxWidth: .infinity, maxHeight: .infinity)
                       }.background(Color.blue)
                           .frame(maxWidth: .infinity)
                       Button(action: {
                           if (stopwatch.is_started)
                           {
                               laps.append(stopwatch.lap());
                           }
                       }) {
                           Text("Lap").foregroundColor(Color.white).frame(maxWidth: .infinity, maxHeight: .infinity)
                       }.background(Color.blue)
                           .frame(maxWidth: .infinity)
                   }.frame(maxWidth: .infinity, minHeight: 50).padding()
                   
                   ForEach(laps, id: \.self) {  lap in
                       LapItem(time: lap).frame(width: .infinity)
                   }
               }.padding()
        }.background(Color.indigo)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro Max")
    }
}
