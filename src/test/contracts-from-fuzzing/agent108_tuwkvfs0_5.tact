struct Wide {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint32;
    e: Int as int64;
    f: Int as uint128;
    g: Int;
    h: Bool;
}

contract Test4 {
    data: Wide;

    init() {
        self.data = Wide{
            a: 1,
            b: 2,
            c: 3,
            d: 4,
            e: 5,
            f: 6,
            g: 7,
            h: true,
        };
    }
}