contract Fuzz20 {
    zero: Int as uint8 = 0;
    one: Int as int8 = -1;
    two: Int as uint16 = 0;
    three: Int as int32 = 0;
    four: Int as uint64 = 0;
    five: Int as int128 = 0;
    six: Int as uint256 = 0;

    init() {
        self.zero = 0;
        self.one = -1;
        self.two = 65535;
        self.three = -123456;
        self.four = 123456789012345;
        self.five = -123456789012345678901234567890;
        self.six = 1234567890123456789012345678901234567890;
    }
}