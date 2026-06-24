contract IntSerializations {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int64;
    d: Int as uint251;

    init() {
        self.a = 1;
        self.b = 256;
        self.c = -123456789;
        self.d = 123456789012345;
    }
}