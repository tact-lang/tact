struct IntAsSizes {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint128;
}

contract SerializedInts {
    data: IntAsSizes;

    init() {
        self.data = IntAsSizes{
            a: 255,
            b: -1000,
            c: 123456,
            d: -123456789,
            e: 123456789012345678901234567890
        };
    }
}