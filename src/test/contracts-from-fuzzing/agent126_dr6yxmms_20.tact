contract VariousSerializations {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint16;
    e: Int as int32;
    f: Int as uint32;
    g: Int as int64;
    h: Int as uint64;

    init() {
        self.a = -5;
        self.b = 250;
        self.c = -1234;
        self.d = 65000;
        self.e = -100000;
        self.f = 3000000000;
        self.g = -5000000000;
        self.h = 10000000000;
    }
}