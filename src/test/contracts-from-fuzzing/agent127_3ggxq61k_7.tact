struct MixedDefaults {
    a: Int = 1;
    b: Int?;
    c: String = "x";
    d: Bool?;
}

contract StructWithMixedDefaults {
    s: MixedDefaults;
    init() {
        self.s = MixedDefaults{ a: 123, b: null, c: "x", d: null };
    }
}