struct OptionalCombos {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract ComboOpt {
    f1: OptionalCombos;
    f2: OptionalCombos?;
    
    init() {
        self.f1 = OptionalCombos{ x: null, y: null, z: null };
        self.f2 = null;
    }
}