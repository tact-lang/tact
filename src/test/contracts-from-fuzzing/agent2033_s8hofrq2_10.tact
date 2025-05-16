struct MixedDefaults {
    a: Int = 1;
    b: Bool;
    c: String = "hi";
    d: Int?;
    e: Bool? = null;
}

contract Test {
    s: MixedDefaults;

    init() {
        self.s = MixedDefaults{
            b: true,
            d: 42
        };
    }
}