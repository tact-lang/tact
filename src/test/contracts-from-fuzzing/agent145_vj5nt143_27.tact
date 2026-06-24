contract SerializeExtremes {
    n1: Int as int1;
    n257: Int as int257;
    u1: Int as uint1;
    u256: Int as uint256;

    init() {
        self.n1 = 0;
        self.n257 = 123;
        self.u1 = 1;
        self.u256 = 456;
    }
}
