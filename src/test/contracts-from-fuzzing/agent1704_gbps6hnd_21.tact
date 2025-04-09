contract IntSerializations {
    a: Int as int64;
    b: Int as uint1;
    c: Int as uint256;

    init() {
        self.a = 12345;
        self.b = 1;
        self.c = 987654321;
    }
}