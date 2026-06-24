struct IntVariants {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int32;
    d: Int as uint64;
    e: Int as int128;
    f: Int as uint256;
    g: Int;
}

contract IntVariantsTest {
    v: IntVariants;

    init() {
        self.v = IntVariants{
            a: -128,
            b: 255,
            c: -1000000,
            d: 123456789,
            e: -1234567890123456,
            f: 123456789012345678901234567890,
            g: 42,
        };
    }
}