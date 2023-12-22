import SwiftUI

struct ContentView: View {
  @State private var alertIsVisible:Bool = false
  @State private var sliderValue:Double = 50
  @State private var game:Game = Game()
   
  var body: some View {
    VStack{
      Text("🎯🎯🎯\n PUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
        .bold()
        .multilineTextAlignment(.center)
        .lineSpacing(4.0)
        .font(.footnote)
        .kerning(2.0)
      
      Text(String(game.target))
        .kerning(-1.0)
        .font(.largeTitle)
        .fontWeight(.black)
      
      HStack{
        Text("1")
          .bold()
        Slider(value: $sliderValue,in: 1.0...100.0)
        Text("100")
          .bold()
      }
      Button("Hit Me"){
        alertIsVisible = true
      }
      .alert(
        "Hello There",
        isPresented: $alertIsVisible,
        actions: {
          Button("Awesome"){
            print("Alert Closed")
          }
        },
        message: {
          Text("""
            The Slider Value is \(Int(sliderValue.rounded())).
            You scored \(game.points(sliderValue: sliderValue))
            """)
        })
    }
  }
}

