contract Test16 {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint32;
    d: Int as int256;

    init() {
        self.a = 1;
        self.b = -42;
        self.c = 100;
        self.d = -123456789012345678901234567890;
    }
}