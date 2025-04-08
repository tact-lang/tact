contract MixedSerializations {
    a: Int as int64;
    b: Int as uint8;
    c: Int;  // default 257 bits
    d: Int as uint4;

    init() {
        self.a = 10;
        self.b = 255;
        self.c = -1000;
        self.d = 7;
    }
}