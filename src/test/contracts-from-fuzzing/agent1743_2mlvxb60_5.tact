struct Wide {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint24;
    d: Int as uint32;
    e: Int as uint64;
    f: Int as uint128;
    g: Int as uint1;
    h: Int as int8;
    i: Int as int16;
    j: Int as int24;
    k: Int as int32;
    l: Int as int64;
}

contract WideTest {
    w: Wide;

    init() {
        self.w = Wide{
            a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 1,
            h: -1, i: -2, j: -3, k: -4, l: -5
        };
    }
}