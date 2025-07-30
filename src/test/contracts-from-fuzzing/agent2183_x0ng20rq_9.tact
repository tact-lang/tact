struct SerialFmt {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint256;
    d: Bool;
}

contract TestContract {
    s: SerialFmt;

    init() {
        self.s = SerialFmt{
            a: 255,
            b: -12345678,
            c: 12345678901234567890,
            d: true
        };
    }
}