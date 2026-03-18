import SwiftUI

struct GestionBeneficiaireView: View {
    var groupe1: Groupe
    var groupe2: Groupe
    var groupe3: Groupe
    var groupe4: Groupe

    @State private var nom = ""
    @State private var prenom = ""
    @State private var telephone = ""
    @State private var nbPersonnes = ""
    @State private var rechercheTel = ""
    @State private var message = ""

    var body: some View {
        VStack(spacing: 20) {
            
            HStack(alignment: .top) {
                VStack(spacing: 10) {
                    Text("Enregistrement du bénéficiaire")
                        .font(.headline)
                        .foregroundColor(.blue)
                    TextField("Nom", text: $nom)
                        .textFieldStyle(.roundedBorder)
                    TextField("Prénom", text: $prenom)
                        .textFieldStyle(.roundedBorder)
                    TextField("Téléphone", text: $telephone)
                        .textFieldStyle(.roundedBorder)
                    TextField("Nb personnes", text: $nbPersonnes)
                        .textFieldStyle(.roundedBorder)
                    
                    Button("Enregistrer") {
                        if let nb = Int(nbPersonnes), !nom.isEmpty, !prenom.isEmpty, !telephone.isEmpty {
                            let b = Beneficiaire(nom: nom, prenom: prenom, telephone: telephone, nbPersonnes: nb)
                            distribuer(b)
                        } else {
                            message = "Remplir tous les champs correctement"
                        }
                    }
                    .tint(.blue)
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                
                Divider()
                VStack(spacing: 10) {
                    Text("Recherche du bénéficiaire")
                        .font(.headline)
                        .foregroundColor(.blue)
                    TextField("Téléphone", text: $rechercheTel)
                        .textFieldStyle(.roundedBorder)
                    Button("Chercher") { chercher() }
                        .tint(.blue)
                        .buttonStyle(.borderedProminent)
                    Text(message)
                        .foregroundColor(.red)
                }
                .padding()
            }
            
            Spacer()
        }
        .padding()
    }

    func distribuer(_ b: Beneficiaire) {
        var groupe: Groupe
        switch b.groupe {
        case 1: groupe = groupe1
        case 2: groupe = groupe2
        case 3: groupe = groupe3
        default: groupe = groupe4
        }
        
        if !groupe.distribuer(b) {
            message = "Stock épuisé pour ce groupe"
        } else {
            message = "Paquet distribué"
        }
    }

    func chercher() {
        var all: [Beneficiaire] = []
        all += groupe1.beneficiaires
        all += groupe2.beneficiaires
        all += groupe3.beneficiaires
        all += groupe4.beneficiaires
        
        if let b = all.first(where: { $0.telephone == rechercheTel }) {
            message = "Déjà distribué au groupe \(b.groupe)"
        } else {
            message = "Bénéficiaire non trouvé"
        }
    }
}
