contract MixedWidths {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint16;
    e: Int as int32;
    f: Int as uint32;
    g: Int as int64;
    h: Int as uint64;
    i: Int as int257;

    init() {
        self.a = -1;
        self.b = 255;
        self.c = -30000;
        self.d = 65535;
        self.e = -2_000_000_000;
        self.f = 4_000_000_000;
        self.g = -9_000_000_000_000_000_000;
        self.h = 18_000_000_000_000_000_000;
        self.i = 123456789;
    }
}