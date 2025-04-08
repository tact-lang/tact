contract NestedStructsMix {
    s1: String;
    s2: String?;
    i1: Int;
    i2: Int?;
    b1: Bool;
    b2: Bool?;

    init() {
        self.s1 = "hi";
        self.s2 = null;
        self.i1 = 1;
        self.i2 = null;
        self.b1 = true;
        self.b2 = null;
    }
}