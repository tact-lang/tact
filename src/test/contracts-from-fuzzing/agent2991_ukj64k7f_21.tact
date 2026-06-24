contract Test {
    largeInt: Int as uint256;

    init() {
        self.largeInt = 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff; //max uint256
    }
}