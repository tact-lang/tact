struct MixedDefaults {
    a: Int = 12;
    b: Bool?;
    c: String = "q";
    d: Int?;
    e: String? = null;
}

contract Test {
    m: MixedDefaults;

    init() {
        self.m = MixedDefaults{
            b: false,
            d: null
        };
    }
}