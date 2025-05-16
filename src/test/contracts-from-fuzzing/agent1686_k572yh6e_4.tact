contract MegaInts {
    a: Int as uint1 = 0;
    b: Int as uint8 = 1;
    c: Int as int16 = -123;
    d: Int as uint32 = 100000;
    e: Int as int64 = -1234567890;
    f: Int as uint128 = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    g: Int as int257 = 123456789;

    init() {
        self.a = 1;
        self.b = 255;
        self.c = -32768;
        self.d = 4294967295;
        self.e = 9223372036854775807;
        self.f = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
        self.g = -123456789;
    }
}