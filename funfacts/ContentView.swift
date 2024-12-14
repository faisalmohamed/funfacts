import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State private var funFact: String = funFactsList[.random(in: 2...301)] ?? ""
    
    var body: some View {
                
        VStack {
            ZStack {
                Image(colorScheme == .dark ? "funfacts-dark" : "funfacts")
                    .resizable()
                    .scaledToFit()
            }
            Text(funFact)
                .foregroundColor(colorScheme == .dark ? .white : .black)
                .multilineTextAlignment(.center)
                .fontWeight(.regular)
                .fontWidth(.standard)
                .padding(25)
            Spacer()
            Button("Next Fun Fact") {
                funFact = funFactsList[.random(in: 2...<funFactsList.count)] ?? ""
                print(funFact)
                
            }
            .font(.title)
            .foregroundColor(.white)
            .buttonStyle(.borderedProminent)
        }
        .font(.title)
        .foregroundColor(.white)
        .buttonStyle(.borderedProminent)
        .cornerRadius(10.0)
        .padding(.all)
    }
}

#Preview {
    ContentView()
}
