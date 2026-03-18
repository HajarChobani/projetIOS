import SwiftUI

struct AccueilView: View {
    var groupe1 = Groupe()
    var groupe2 = Groupe()
    var groupe3 = Groupe()
    var groupe4 = Groupe()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Application de distribution")
                .font(.title)
                .foregroundColor(.green)
            
            let groupes = [groupe1, groupe2, groupe3, groupe4]
            
            ForEach(0..<groupes.count, id: \.self) { i in
                NavigationLink(
                    "Groupe \(i+1): \(groupes[i].stock) paquets",
                    destination: ListeBeneficiairesView(groupe: groupes[i])
                )
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            
            HStack(spacing: 20) {
                Button("Quitter") { exit(0) }
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                
                NavigationLink("Continuer",
                               destination: GestionBeneficiaireView(
                                groupe1: groupe1,
                                groupe2: groupe2,
                                groupe3: groupe3,
                                groupe4: groupe4))
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}
