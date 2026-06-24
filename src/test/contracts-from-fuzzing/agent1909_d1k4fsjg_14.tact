contract MixedSerialization {
    a: Int as uint32;
    b: Int as int64;
    c: Int;
    d: Int as coins;

    init() {
        self.a = 1000;
        self.b = -50000000;
        self.c = 1234567890123456789;
        self.d = 0;
    }
}