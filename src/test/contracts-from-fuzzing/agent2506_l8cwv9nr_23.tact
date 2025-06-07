struct IntSerials {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint64;
    d: Int;
}

contract DiverseIntsTest {
    vals: IntSerials;
    init() {
        self.vals = IntSerials{
            a: 127,
            b: -12345,
            c: 12345678,
            d: -87654321
        };
    }
}
