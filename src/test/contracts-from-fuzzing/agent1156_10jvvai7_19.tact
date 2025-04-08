struct MixOptDef {
    x: Int = 1;
    y: Int?;
    z: Bool = false;
    s: String?;
}

contract ComplexDefaults {
    data: MixOptDef;

    init() {
        self.data = MixOptDef{ x: 5, y: null, z: true, s: null };
    }
}