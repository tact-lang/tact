contract MismatchedSerialization {
    a: Int as int64;
    b: Int as uint4;
    c: Int as coins;
    d: Int as int256;

    init() {
        self.a = -12345;
        self.b = 14;
        self.c = ton("2.5");
        self.d = 123456789012345678901234567890;
    }
}
