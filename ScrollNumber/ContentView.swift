//
//  ContentView.swift
//  ScrollNumber
//
//  Created by Angelos Staboulis on 29/6/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedCell = 2
    @State private var newSelection = 0
    @State var cells:[Int] = []
    var body: some View {
        Text("Horizontal SwiftUI Scroll Example")
        ScrollViewReader { scrollViewProxy in
                HStack{
                    Button(action: {
                            selectedCell = 2
                            newSelection = selectedCell
                    }, label: {
                       Image(systemName: "chevron.left.2")
                    })
                    Button(action: {
                            newSelection =  selectedCell + 1
                            selectedCell = newSelection
                    }, label: {
                       Image(systemName: "arrow.left")
                    })
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(cells,id:\.self) {
                                Text("\($0)")
                                    .frame(width: 50, height: 45)
                            }.scrollTargetLayout()
                        }
                    }
                    Button(action: {
                            newSelection =  selectedCell - 1
                            selectedCell = newSelection
                    }, label: {
                       Image(systemName: "arrow.right")
                    })
                    Button(action: {
                            selectedCell = cells.count - 3
                            newSelection = selectedCell
                    }, label: {
                       Image(systemName: "chevron.right.2")
                    })
                }.onAppear(perform: {
                    for item in 0..<20{
                        cells.append(item)
                    }
            })
            .onChange(of: selectedCell) {
                    scrollViewProxy.scrollTo(selectedCell, anchor: .center)
            }
        }
    }
    
 
}

#Preview {
    ContentView()
}
