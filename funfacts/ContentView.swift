import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State private var funFact: String = funFactsList[.random(in: 2...301)] ?? ""
    @State private var isShareSheetPresented = false
    
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
                .font(.title)
                .fontWeight(.regular)
                .fontWidth(.standard)
                .padding(25)
            Spacer()
            HStack {
                Button("Next Fun Fact") {
                    funFact = funFactsList[.random(in: 2..<funFactsList.count)] ?? ""
                    print(funFact)
                    
                }
                .font(.title)
                .foregroundColor(.white)
                .buttonStyle(.borderedProminent)
                .padding(.bottom)
                .padding(.leading, 85)
                .sensoryFeedback(.increase, trigger: funFact)
                
                Button(action: { isShareSheetPresented = true }) {
                    Image(systemName: "square.and.arrow.up")
                        .font(.title)
                        .buttonStyle(.borderedProminent)
                        .padding(.bottom)
                        .padding(.leading, 30)
                        .padding(.trailing, 15)
                        .sheet(isPresented: $isShareSheetPresented) { ShareSheet(items: ["\(funFact)"])
                        }
                }
            }
        }
    }
}
    #Preview {
        ContentView()
    }

