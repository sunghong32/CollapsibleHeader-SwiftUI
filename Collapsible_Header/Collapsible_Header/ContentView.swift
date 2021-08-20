//
//  ContentView.swift
//  Collapsible_Header
//
//  Created by 민성홍 on 2021/08/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { proxy in
            let topEdge = proxy.safeAreaInsets.top

            Home(topEdge: topEdge)
                .ignoresSafeArea(.all, edges: .top)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
