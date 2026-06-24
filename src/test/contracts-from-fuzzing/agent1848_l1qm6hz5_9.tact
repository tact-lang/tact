contract SerializeInts {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint256;

    init() {
        self.a = 42;
        self.b = -12345678;
        self.c = 123456789012345678901234567890;
    }
}