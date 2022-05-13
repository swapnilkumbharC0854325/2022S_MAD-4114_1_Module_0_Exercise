//
//  LapItem.swift
//  stopwatch
//
//  Created by Swapnil Kumbhar on 2022-05-13.
//

import SwiftUI

struct LapItem: View {

    @State var time = "0.0";
    @State var id = 1;
    var body: some View {
        HStack {
            Text("\(time)")
                .frame(width: .infinity)
            Spacer()
            Text("Lap \(id)")
                    .frame(width: .infinity)
            
        }.frame(width: .infinity, height: 50).padding(10).overlay(Divider().background(Color.blue).frame(height: 10), alignment: .bottom).background(Color.blue)
        
    }
}

struct LapItem_Previews: PreviewProvider {
    static var previews: some View {
        LapItem()
    }
}
