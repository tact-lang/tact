contract ScalarsLarge {
    a: Int as int257;
    b: Int;
    c: Int as uint256;

    init() {
        self.a = -12345678901234567890;
        self.b = 98765432109876543210;
        self.c = 123456789012345678901234567890;
    }
}