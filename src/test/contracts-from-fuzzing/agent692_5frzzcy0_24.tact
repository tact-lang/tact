contract SerializeVariants {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint16;
    e: Int as int32;
    f: Int as uint32;
    g: Int as int64;
    h: Int as uint64;

    init() {
        self.a = -10;
        self.b = 250;
        self.c = -2000;
        self.d = 32000;
        self.e = -1000000;
        self.f = 3000000;
        self.g = -1000000000;
        self.h = 1000000000;
    }
}