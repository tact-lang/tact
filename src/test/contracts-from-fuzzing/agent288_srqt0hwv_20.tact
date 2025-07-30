struct SerialFormat {
    a: Int as uint4;
    b: Int as int64;
    c: Int as uint256;
}

contract TestContract {
    s: SerialFormat;

    init() {
        self.s = SerialFormat{
            a: 7,
            b: -42,
            c: 123456
        };
    }
}