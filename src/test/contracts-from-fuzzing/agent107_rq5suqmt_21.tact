contract MixedSerialization {
    a: Int as int64;
    b: Int as uint128;
    c: Int;
    d: Int as uint4;
    e: Int as int1;
    init() {
        self.a = -5;
        self.b = 123456789;
        self.c = 42;
        self.d = 15;
        self.e = 1;
    }
}