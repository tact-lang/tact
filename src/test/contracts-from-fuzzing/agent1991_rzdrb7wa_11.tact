contract MixSerialization {
    a: Int as uint8;
    b: Int as int256;
    c: Int as uint4;
    d: Int as uint64;
    e: Int;

    init() {
        self.a = 1;
        self.b = -2;
        self.c = 3;
        self.d = 4;
        self.e = 5;
    }
}