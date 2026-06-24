contract ManySerializations {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint64;
    d: Int as int128;
    e: Int as uint256;

    init() {
        self.a = 10;
        self.b = -50;
        self.c = 123456789;
        self.d = -123456789012345;
        self.e = 987654321098765432109876543210;
    }
}