contract StringIntMix {
    s1: String;
    s2: String?;
    i1: Int;
    i2: Int?;

    init() {
        self.s1 = "abc";
        self.s2 = null;
        self.i1 = 123;
        self.i2 = null;
    }
}
