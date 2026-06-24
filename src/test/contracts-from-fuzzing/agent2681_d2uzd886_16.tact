contract MixedSerialization {
    a: Int as uint8;
    b: Int as int64;
    c: Int as coins;
    d: Int;

    init() {
        self.a = 5;
        self.b = -123456789;
        self.c = 10_000_000;
        self.d = 999;
    }
}