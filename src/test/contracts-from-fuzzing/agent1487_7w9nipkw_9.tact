contract IntSerializations {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint32;
    e: Int as int64;
    f: Int as int257;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = -3;
        self.d = 4;
        self.e = -5;
        self.f = 6;
    }
}