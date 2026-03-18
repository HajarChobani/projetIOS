import SwiftUI

struct SplashScreen: View {
    var body: some View {
        VStack {
            Image("logoApp")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            AccueilView()
        }
    }
}
