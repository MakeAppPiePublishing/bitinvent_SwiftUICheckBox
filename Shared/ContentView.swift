//
//  ContentView.swift
//  Shared
//
//  Created by Steven Lipton on 2/28/21.
//

import SwiftUI

struct ContentView: View {
    @State private var model:[Bool] = Array(repeating: false,count:5)
    @State private var index:Int = 0
    var body: some View {
        VStack{
            Image(systemName:"\(index).square.fill")
                .resizable()
                .scaledToFit()
            HStack{ // to show selecting check items.
                ForEach(0...4, id:\.self){ item in
                    Image(systemName: model[item] ? "\(item).square" : "square")
                } .font(.title)
            }
            // The list
            List(0...4,id:\.self){ item in
                RowView(isChecked: $model[item], index: .constant(item))
                    .font(.title)
                    .padding()
                    .onTapGesture {
                        self.index = item
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
