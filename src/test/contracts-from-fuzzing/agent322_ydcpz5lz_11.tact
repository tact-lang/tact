contract Test {
    zero: Int as uint1;
    one: Int as uint8;
    two: Int as uint16;
    three: Int as uint32;
    four: Int as uint64;
    five: Int as uint128;
    six: Int as uint256;

    init() {
        self.zero = 0;
        self.one = 1;
        self.two = 2;
        self.three = 3;
        self.four = 4;
        self.five = 5;
        self.six = 6;
    }
}