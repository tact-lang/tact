struct Ints {
    a: Int as uint8;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int16;
    e: Int as uint32;
    f: Int as int32;
    g: Int as uint64;
    h: Int as int64;
}

contract IntSerialization {
    vals: Ints;
    init() {
        self.vals = Ints{
            a: 1,
            b: -1,
            c: 2,
            d: -2,
            e: 3,
            f: -3,
            g: 4,
            h: -4,
        };
    }
}