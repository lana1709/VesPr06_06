//
//  ContentView.swift
//  FirstApp
//
//  Created by luser on 05.06.2021.
//

import SwiftUI


struct SignInView: View {
    @State var email = ""
    @State var password = ""
    @ObservedObject var userObject = UserObject()
    @Binding var page : Int
    var body: some View {
        VStack {
           Image("logo")
            .resizable()
            .frame(width: 184, height: 184, alignment: .center)
            .padding(.bottom, 26)
            Text("EMAIL")
                .frame(width: UIScreen.main
                        .bounds.width-50, height: nil, alignment: .leading)
            HStack {
                Image(systemName: "envelope")
                    .font(.title2)
                    .padding(.leading)
                TextField("name@email.com", text: $email)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
            }
            .frame(width: UIScreen.main
                    .bounds.width-50, height: 48, alignment: .center)
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            Text("PASSWORD")
                .frame(width: UIScreen.main
                        .bounds.width-50, height: nil, alignment: .leading)
                .padding(.top, 15)
            HStack {
                Image(systemName: "lock")
                    .font(.title2)
                    .padding(.leading)
                SecureField("***********", text: $password)
            }
            .frame(width: UIScreen.main
                    .bounds.width-50, height: 48, alignment: .center)
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            
            
            Button(action: {
                userObject.login(email: email, password: password)
                page = 2
            }, label: {
                Text("SIGN IN")
                    .foregroundColor(.white)
                    .frame(width: 335, height: 52, alignment: .center)
                    .background(Color("AccentColor"))
                    .cornerRadius(50)
            }).padding(.top)
            
            HStack {
                Text("Already have an account?")
                Text("Login")
                    .foregroundColor(.blue)
            }.padding(.top)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(page: .constant(1))
    }
}
