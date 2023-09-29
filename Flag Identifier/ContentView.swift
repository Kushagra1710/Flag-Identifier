//
//  ContentView.swift
//  Flag Identifier
//
//  Created by Kushagra sharma on 08/09/23.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var count = 0
    @State private var contestOver = 0
    @State private var complete = false
    @State private var correctAnswer = Int.random(in:0...2)
    @State private var ShowingScore = false
    @State private var ScoreTitle = ""
    var body: some View {
        
        ZStack{
           LinearGradient(colors: [.blue,.yellow, .pink], startPoint: .top, endPoint: .bottom)
            /*RadialGradient(stops: [
                .init(color: .pink, location: 0.3),
                .init(color: .yellow, location:0.6)
            ], center: .top, startRadius: 200, endRadius: 400)
              */
            .ignoresSafeArea()
            VStack{
                
                    Spacer()
                    Text("Guess The Flag")
                        .font(.title.weight(.heavy))
                    
                    
                    VStack(spacing:15){
                        
                        VStack {
                            Text("Identify the flag of")
                                .foregroundColor(.secondary)
                                .font(.subheadline.weight(.heavy))
                            
                            
                            Text(countries[correctAnswer])
                            
                            
                                .font(Font.largeTitle)
                                .fontDesign(Font.Design.rounded)
                                .fontWeight(Font.Weight.semibold)
                            
                            
                        }
                        ForEach(0..<3){number in
                            Button{
                                Tapped(number)
                            }label: {
                                Image(countries[number])
                                    .renderingMode(.original)
                                    .clipShape(Capsule())
                                    .shadow(radius:10)
                            }
                        }
                    }
                    
                    .frame(maxWidth: .infinity)
                    .padding(.vertical,20)
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    Spacer()
                    //Spacer()
                    Text("Score🎯:\(count)/8")
                        .font(.title2.bold())
                        .padding()
                        .background(.thinMaterial)
                        .clipShape(Capsule())
                    Spacer()
                }
                .padding()
            
            
        }
        
        
        .alert("Yup!!",isPresented: $complete){
            Button("Reset", action:Reset)
                
        }   message: {
            Text("Final Score is \(count)")
        }
       
            
        .alert(ScoreTitle, isPresented: $ShowingScore){
            Button("Continue", action: NextQuestion)
                }  message : {
                   Text("Your Score is \(count)")
            }
        
        }
    
        func Tapped (_ number:Int){
            contestOver = contestOver+1
            if number == correctAnswer{
                ScoreTitle = "Correct Answer ✅"
                count = count + 1
                
            }else{
                ScoreTitle = "Wrong Answer ❌"
            }
            if (contestOver == 8){
                complete = true
            }
            else{
                ShowingScore = true
            }
        }
        func NextQuestion(){
            countries.shuffle()
            correctAnswer = Int.random(in:0...2)
            
        }
    func Reset(){
        countries.shuffle()
        correctAnswer = Int.random(in:0...2)
        count = 0
    }
   
        
    
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

//completed my project and also feeling happy while learning new topics
//15/9/23  3:11 AM
