contract MixedSerialization {
    a: Int as int64;
    b: Int as uint4;
    c: Int;  // full 257-bit signed
    d: Int as coins;

    init() {
        self.a = -12345;
        self.b = 8;
        self.c = 999;
        self.d = ton("1");
    }
}