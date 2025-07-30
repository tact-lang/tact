contract BigSerialization {
    a: Int as int257;
    b: Int as uint256;
    c: Int as int256;
    d: Int as uint255;

    init() {
        self.a = 123;
        self.b = 456;
        self.c = -789;
        self.d = 999;
    }
}