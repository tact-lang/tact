contract TestContract {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
    d: Int as int8;
    e: Int as int16;
    f: Int as int32;

    init() {
        self.a = 1;
        self.b = 256;
        self.c = 65536;
        self.d = -1;
        self.e = -256;
        self.f = -65536;
    }
}