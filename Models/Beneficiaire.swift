import Foundation

struct Beneficiaire {
    var nom: String
    var prenom: String
    var telephone: String
    var nbPersonnes: Int
    
    var groupe: Int {
        switch nbPersonnes {
        case 0...2: return 1
        case 3...4: return 2
        case 5...6: return 3
        default: return 4
        }
    }
}
