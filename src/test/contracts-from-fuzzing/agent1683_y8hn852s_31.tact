contract DifferentSerializations {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint128;

    init() {
        self.a = 255;
        self.b = -32768;
        self.c = 123456789;
        self.d = -1234567890;
        self.e = 123456789012345678901234567890;
    }

    receive() {
        self.a = 128;
    }
}