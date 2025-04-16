contract MixedSerialized {
    a: Int as int64;
    b: Int as coins;
    c: Int as uint4;
    d: Int as int16;
    e: Int as uint8;
    f: Int;

    init() {
        self.a = -10;
        self.b = ton("0.001");
        self.c = 13;
        self.d = -123;
        self.e = 200;
        self.f = 123456789;
    }
}