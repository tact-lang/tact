struct MixedDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "abc";
    d: Int? = null;
    e: Bool? = null;
}

contract StructWithDefaults {
    s: MixedDefaults;

    init() {
        self.s = MixedDefaults{};
    }
}