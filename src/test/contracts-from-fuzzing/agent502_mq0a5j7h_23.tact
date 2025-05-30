contract MixedSerializations {
    a: Int as int4;
    b: Int as uint4;
    c: Int as int64;
    d: Int as uint128;

    init() {
        self.a = 3;
        self.b = 7;
        self.c = 42;
        self.d = 256;
    }
}