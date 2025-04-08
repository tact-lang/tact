struct SerialInts {
    small: Int as uint4;
    big: Int as int64;
    huge: Int as uint256;
}

contract AnnotatedPrimitives {
    data: SerialInts = SerialInts{
        small: 5,
        big: -12345,
        huge: 9876543210123456789
    };

    init() {
        self.data = SerialInts{
            small: 9,
            big: 123456789,
            huge: 12345678901234567890
        };
    }
}