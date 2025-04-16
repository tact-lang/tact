contract MaxIntAssignment {
    val: Int as uint256;

    init() {
        self.val = 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff; // 2^256 - 1
    }
}