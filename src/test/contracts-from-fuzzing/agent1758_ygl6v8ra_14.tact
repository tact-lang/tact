contract SerializationWidth {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint256;
    d: Int;

    init() {
        self.a = 255;
        self.b = -123456789;
        self.c = 1234567890123456789;
        self.d = -1;
    }
}