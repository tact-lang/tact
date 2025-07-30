struct ManyInts {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
    d: Int as int64;
}

contract SerializedInts {
    ints: ManyInts;

    init() {
        self.ints = ManyInts{
            a: 1,
            b: 255,
            c: 65535,
            d: -42,
        };
    }
}
