contract SerializationFormats {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint256;
    d: Int as int1;

    init() {
        self.a = 1;
        self.b = -10;
        self.c = 123456789012345678901234567890;
        self.d = -1;
    }
}