contract TestContract {
    a: Int as int8;
    b: Int as int16;
    c: Int as int32;
    d: Int as int64;
    e: Int as uint8;
    f: Int as uint16;
    g: Int as uint32;
    h: Int as uint64;

    init() {
        self.a = -10;
        self.b = -1000;
        self.c = -100000;
        self.d = -10000000000;
        self.e = 10;
        self.f = 1000;
        self.g = 100000;
        self.h = 10000000000;
    }
}