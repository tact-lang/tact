contract MixedPrimitives {
    i1: Int;
    b1: Bool;
    s1: String;
    i2: Int?;
    b2: Bool?;
    s2: String?;

    init() {
        self.i1 = 99;
        self.b1 = false;
        self.s1 = "abc";
        self.i2 = null;
        self.b2 = true;
        self.s2 = null;
    }
}