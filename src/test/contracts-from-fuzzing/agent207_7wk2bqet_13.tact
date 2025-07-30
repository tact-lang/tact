contract Test13 {
    a: Int as int8 = 1;
    b: Int as uint8 = 255;
    c: Int as int16 = -32768;
    d: Int as uint16 = 65535;
    e: Int as int32 = -2147483648;
    f: Int as uint32 = 4294967295;

    init() {
        self.a = 1;
        self.b = 255;
        self.c = -32768;
        self.d = 65535;
        self.e = -2147483648;
        self.f = 4294967295;
    }
}