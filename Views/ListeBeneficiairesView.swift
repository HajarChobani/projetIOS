import SwiftUI

struct ListeBeneficiairesView: View {
    var groupe: Groupe
    
    var body: some View {
        VStack {
            if groupe.beneficiaires.isEmpty {
                Text("Aucun bénéficiaire n'a reçu de paquet")
            } else {
                List(groupe.beneficiaires, id: \.telephone) { b in
                    VStack(alignment: .leading) {
                        Text("\(b.nom) \(b.prenom)")
                        Text("Tel: \(b.telephone)").font(.headline)
                    }
                }
            }
        }
        .padding()
    }
}
