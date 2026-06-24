struct MixedDef {
    x: Int = 10;
    y: Bool? = null;
    z: String = "abc";
    p: Int? = 5;
}

contract ComboDefaults {
    s: MixedDef;
    init() {
        self.s = MixedDef{};
    }
}