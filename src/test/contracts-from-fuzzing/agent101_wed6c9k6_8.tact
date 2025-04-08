struct IntSizes {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint16;
    e: Int as int32;
    f: Int as uint32;
    g: Int as int64;
    h: Int as uint64;
}

contract TestIntSizes {
    data: IntSizes;

    init() {
        self.data = IntSizes{
            a: -5,
            b: 5,
            c: -100,
            d: 100,
            e: -1000,
            f: 1000,
            g: -10000,
            h: 10000,
        };
    }
}