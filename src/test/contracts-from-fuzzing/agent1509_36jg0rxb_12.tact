contract InitDifferentSerializations {
    a: Int as int257;
    b: Int as uint4;
    c: Int as int8;
    d: Int as uint64;

    init() {
        self.a = -1;
        self.b = 15;
        self.c = -128;
        self.d = 123456789;
    }
}