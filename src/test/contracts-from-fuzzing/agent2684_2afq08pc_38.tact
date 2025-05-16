contract MixedOptNonopt {
    i1: Int = 1;
    i2: Int?;
    s1: String = "s";
    s2: String?;
    b1: Bool = false;
    b2: Bool?;

    init() {
        self.i2 = null;
        self.s2 = null;
        self.b2 = null;
    }
}
