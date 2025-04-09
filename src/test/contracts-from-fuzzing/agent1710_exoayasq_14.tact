contract Test {
    bigInt: Int as uint256;
    smallInt: Int as uint4;

    init() {
        self.bigInt = 10000000000000000000000000000;
        self.smallInt = 15;
    }
}