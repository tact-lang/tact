struct MixedDefaults {
    a: Int?;
    b: Int? = null;
    c: Bool?;
    d: Bool? = null;
}

contract StructWithDefaults {
    m: MixedDefaults;

    init() {
        self.m = MixedDefaults {
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}