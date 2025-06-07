contract EdgeSerializations {
    a: Int as uint1;
    b: Int as int1;
    c: Int as uint256;
    d: Int as int257;
    init() {
        self.a = 1;
        self.b = -1;
        self.c = 123456789012345678901234567890;
        self.d = -123456789012345678901234567890;
    }
}