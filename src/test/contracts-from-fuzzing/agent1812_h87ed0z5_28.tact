contract NestedDefaultOptionalMix {
    s1: String? = null;
    i1: Int? = null;
    b1: Bool? = null;
    s2: String?;
    i2: Int?;
    b2: Bool?;

    init() {
        self.s2 = "hello";
        self.i2 = 42;
        self.b2 = true;
    }
}