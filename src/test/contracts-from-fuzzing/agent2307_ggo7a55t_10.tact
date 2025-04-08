struct ManyInts {
    a: Int;
    b: Int as uint8;
    c: Int as int64;
    d: Int as uint256;
    e: Int;
    f: Int as int8;
    g: Int as uint4;
    h: Int;
}

contract IntVariants {
    store: ManyInts;

    init() {
        self.store = ManyInts{
            a: -1,
            b: 255,
            c: 42,
            d: 123456789012345678901234567890,
            e: 0,
            f: -128,
            g: 15,
            h: 999
        };
    }
}
