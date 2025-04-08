struct MixedDefaults {
    s1: String? = null;
    s2: String? = "abc";
    b1: Bool? = null;
    b2: Bool? = true;
    i1: Int? = null;
    i2: Int? = 1234;
}

contract OptionalDefaults {
    data: MixedDefaults;

    init() {
        self.data = MixedDefaults{};
    }
}