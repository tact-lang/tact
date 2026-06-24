contract SerializationCheck {
    a: Int as uint8;
    b: Int as int16;
    c: Int as int64;
    d: Int as uint256;

    init() {
        self.a = 127;
        self.b = -1000;
        self.c = 123456789;
        self.d = 1 << 255;
    }
}
