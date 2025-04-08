contract SerializeInts {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint256;

    init() {
        self.a = 5;
        self.b = -123;
        self.c = 9999;
        self.d = -12345678;
        self.e = 123456789012345678901234567890;
    }
}
