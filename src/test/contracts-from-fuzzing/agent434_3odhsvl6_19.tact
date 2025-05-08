contract MinMaxInts {
    u4: Int as uint4;
    i4: Int as int4;
    u256: Int as uint256;
    i257: Int as int257;

    init() {
        self.u4 = 15;
        self.i4 = -8;
        self.u256 = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
        self.i257 = -0x10000000000000000000000000000000000000000000000000000000000000000;
    }

    receive() {}
}
