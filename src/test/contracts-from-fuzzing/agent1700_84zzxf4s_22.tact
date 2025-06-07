contract MaxBitWidths {
    int257: Int as int257;
    uint256: Int as uint256;
    int1: Int as int1;
    uint1: Int as uint1;

    init() {
        self.int257 = -115792089237316195423570985008687907853269984665640564039457584007913129639936; // -2^256
        self.uint256 = 115792089237316195423570985008687907853269984665640564039457584007913129639935; // 2^256 - 1
        self.int1 = -1;
        self.uint1 = 1;
    }
}
