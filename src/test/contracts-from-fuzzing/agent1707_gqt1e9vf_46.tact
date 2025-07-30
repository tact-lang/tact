contract ManyIntBitWidth {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint12;
    d: Int as int16;
    e: Int as uint32;
    f: Int as int64;

    init() {
        self.a = 10;
        self.b = -8;
        self.c = 3000;
        self.d = -12345;
        self.e = 4294967295;
        self.f = -9223372036854775808;
    }
}