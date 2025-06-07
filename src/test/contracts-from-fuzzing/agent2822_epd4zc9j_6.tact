struct MixOptDef {
    x: Int?;
    y: Int = 99;
    z: Int?;
}

contract MixOptionalDefault {
    data: MixOptDef;
    init() {
        self.data = MixOptDef{ y: 123 };
    }
}