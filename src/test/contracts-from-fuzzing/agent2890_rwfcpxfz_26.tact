contract MixedSerialization {
    a: Int as uint8;
    b: Int;
    c: Int as int64;
    d: Int as coins;
    e: Int as uint32;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = -3;
        self.d = ton("1");
        self.e = 4;
    }
}