struct Compact {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
    d: Int as int64;
}

contract SerializedSizes {
    s: Compact;

    init() {
        self.s = Compact{
            a: 1,
            b: 2,
            c: 3,
            d: 4,
        };
    }
}