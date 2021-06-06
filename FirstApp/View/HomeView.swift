//
//  HomeView.swift
//  FirstApp
//
//  Created by luser on 05.06.2021.
//

import SwiftUI
import SDWebImageSwiftUI
struct HomeView: View {
    @StateObject var movieObject = MovieObject()
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "bookmark")
                Spacer()
                Text("Social").font(.title)
                Spacer()
                Image(systemName: "bell")
            }.padding()
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack {
//                    ForEach(0...15, id: \.self) { _ in
//                        Image("logo")
//                            .resizable()
//                            .frame(width: 75, height: 75, alignment: .center)
//                    }
                    ForEach(movieObject.posters, id: \.self) { poster in
                    WebImage(url: URL(string: "http://cinema.areas.su/up/images/\(poster)"))
                        .resizable()
                        .frame(width: 75, height: 75)
                        .clipShape(Circle())
                }
                }
                .border(Color.black)
            })
            
            Spacer()
        }
        .onAppear{
            movieObject.getMovies()
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
