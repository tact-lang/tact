contract SerialFormats {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint64;
    d: Int as int257;
    e: Int as uint1;

    init() {
        self.a = 7;
        self.b = -8;
        self.c = 1234567890;
        self.d = -1;
        self.e = 1;
    }
}