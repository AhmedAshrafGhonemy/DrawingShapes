//
//  ContentView.swift
//  DrawShapes
//
//  Created by macbook on 22/12/2021.
//

import SwiftUI

struct Rectangle1 : Shape {
    func path(in rect: CGRect) -> Path {
        Path{ path in
            let horizontalOffset : CGFloat = rect.width * 0.35
            
            path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX , y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - horizontalOffset, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX , y: rect.maxY))
            

        }
    }
    
    
}

struct ContentView: View {
    
    @State var ShownPhotoPicker : Bool = false
    @State var avatarImage = UIImage(systemName: "pencil")!
    var body: some View {
        NavigationView{
        ZStack{
            Rectangle1()
            .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round))
            .frame(width: 300, height: 300)
            .foregroundColor(.black)
            .onTapGesture {
                ShownPhotoPicker = true
            }
            
            Rectangle1()
                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round))
                .rotation(Angle(degrees: 180))
                .frame(width: 300, height: 300)
                .foregroundColor(.black)
                .onTapGesture {
                    ShownPhotoPicker = true
                    
                }
                  
            
        }
        .navigationTitle("Image In Shape")
        .sheet(isPresented: $ShownPhotoPicker , content: {
            PhotoPicker(avatarImage: $avatarImage)
        })
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        ContentView()
        }
        
    }
}
