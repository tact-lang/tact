struct MixOptDef {
    a: Int? = null;
    b: String = "";
    c: Bool?;
}

contract MixedDefaults {
    m: MixOptDef;

    init() {
        self.m = MixOptDef{c: true};
    }
}