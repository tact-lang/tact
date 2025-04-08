contract SerializedFields {
    a: Int as uint4;
    b: Int as int64;
    c: Int as uint128;
    d: Int as uint256;

    init() {
        self.a = 7;
        self.b = -42;
        self.c = 12345678901234567890;
        self.d = 999999999999999999999999999999;
    }
}