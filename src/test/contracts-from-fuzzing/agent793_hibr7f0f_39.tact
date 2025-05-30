struct MixOptDef {
    a: Int = 5;
    b: Int?;
    c: Bool = false;
    d: Bool?;
}

contract MixedDefaults {
    m: MixOptDef;
    init() {
        self.m = MixOptDef{
            b: null,
            d: null,
        };
    }
}