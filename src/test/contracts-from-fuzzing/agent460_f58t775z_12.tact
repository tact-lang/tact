contract OptionalMix {
    i1: Int?;
    i2: Int = 0;
    i3: Int?;
    b1: Bool?;
    b2: Bool = false;
    s1: String?;
    s2: String = "test";

    init() {
        self.i1 = 123;
        self.i2 = 456;
        self.i3 = null;
        self.b1 = true;
        self.b2 = true;
        self.s1 = "hello";
        self.s2 = "world";
    }
}
