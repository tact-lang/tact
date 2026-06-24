contract ManyIntBits {
    a: Int as int8 = 1;
    b: Int as uint8 = 2;
    c: Int as int16 = 3;
    d: Int as uint16 = 4;
    e: Int as int32 = 5;
    f: Int as uint32 = 6;
    g: Int as int64 = 7;
    h: Int as uint64 = 8;

    init() {
        self.a = -5;
        self.b = 255;
        self.c = -30000;
        self.d = 65535;
        self.e = -100000;
        self.f = 100000;
        self.g = -5000000000;
        self.h = 10000000000;
    }
}