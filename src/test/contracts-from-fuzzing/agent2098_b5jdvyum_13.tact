contract MaxUintField {
    bigVal: Int as uint256;

    init() {
        self.bigVal = 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
    }
}
