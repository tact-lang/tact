contract SerializedFields {
    a: Int as uint8;
    b: Int as int64;
    c: Int as coins;
    d: Int as int257;
    e: Int as uint256;
    init() {
        self.a = 42;
        self.b = -123456789;
        self.c = 1000000000;
        self.d = -1;
        self.e = 123456789012345678901234567890;
    }
    receive() {}
}