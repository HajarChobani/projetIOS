class Groupe {
    var stock: Int
    var beneficiaires: [Beneficiaire] = []
    
    init() {
        self.stock = Int.random(in: 8...11)
    }
    
    func distribuer(_ b: Beneficiaire) -> Bool {
        if stock > 0 {
            stock -= 1
            beneficiaires.append(b)
            return true
        }
        return false
    }
}
