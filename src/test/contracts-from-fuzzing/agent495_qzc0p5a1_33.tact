struct CombinedOptionals {
    x: Int?;
    y: Bool?;
    z: String?;
    w: Slice?;
}

contract OptCombo {
    storage: CombinedOptionals;

    init() {
        self.storage = CombinedOptionals{ x:null, y:null, z:null, w:null };
    }
}