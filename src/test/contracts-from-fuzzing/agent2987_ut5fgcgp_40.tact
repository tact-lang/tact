struct IntSizes {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint64;
    d: Int;
}

contract IntSizesContract {
    data: IntSizes;

    init() {
        self.data = IntSizes{
            a: 255,
            b: -32768,
            c: 18446744073709551615,
            d: -1
        };
    }
}
