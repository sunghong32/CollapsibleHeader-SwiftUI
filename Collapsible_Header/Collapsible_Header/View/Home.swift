//
//  Home.swift
//  Collapsible_Header
//
//  Created by 민성홍 on 2021/08/20.
//

import SwiftUI

struct Home: View {
    let maxHeight = UIScreen.main.bounds.height / 3.5

    var topEdge: CGFloat

    @State var offset: CGFloat = 0
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                // Top Nav view...


                GeometryReader { proxy in
                    TopBar(topEdge: topEdge, offset: $offset, maxHeight: maxHeight)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: getHeaderHeight(), alignment: .bottom)
                        .background(Color.green)
                        .overlay(
                            HStack(spacing: 15) {
                                Button(action: {

                                }, label: {
                                    Image(systemName: "xmark")
                                        .font(.body.bold())
                                })

                                Spacer()
                                
                                Text("iJustine")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .opacity(Double(topBarTitleOpacity()))

                                Spacer()

                                Button(action: {

                                }, label: {
                                    Image(systemName: "line.horizontal.3.decrease")
                                        .font(.body.bold())
                                })
                            }
                            .padding(.horizontal)
                            .frame(height: 80)
                            .foregroundColor(.white)
                            .padding(.top, topEdge)

                            ,alignment: .top
                        )

                }
                .frame(height: maxHeight)
                .offset(y: -offset)
                .zIndex(1)

                VStack(spacing: 15) {
                    ForEach(0..<30) {_ in
                        Image(systemName: "person")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                    }
                }
                .padding()
                .zIndex(0)
            }
            .modifier(OffsetModifier(offset: $offset))
        }
        .coordinateSpace(name: "SCROLL")
    }

    func getHeaderHeight() -> CGFloat {
        let topHeight = maxHeight + offset

        return topHeight > (80 + topEdge) ? topHeight : (80 + topEdge)
    }

    func topBarTitleOpacity() -> CGFloat {
        let progress = -(offset + 60) / (maxHeight - (80 + topEdge))

        return progress
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TopBar: View {
    var topEdge: CGFloat
    @Binding var offset: CGFloat

    var maxHeight: CGFloat

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("iJustine")
                .font(.largeTitle.bold())

            Text("Justin Ezarik is an American YouTuber, host, author, She is best known as iJustine")
                .fontWeight(.semibold)
                .foregroundColor(Color.white.opacity(0.8))
        }
        .padding()
        .padding(.bottom)
        .opacity(Double(getOpacity()))
    }

    func getOpacity() -> CGFloat {
        let progress = -offset / 70

        let opacity = 1 - progress

        return offset < 0 ? opacity : 1
    }
}
