struct Serial {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint128;
    f: Int as int1;
}

contract Test {
    ser: Serial;

    init() {
        self.ser = Serial{
            a: 1,
            b: -12,
            c: 12345,
            d: -123456789,
            e: 123456789123456789,
            f: 1,
        };
    }
}