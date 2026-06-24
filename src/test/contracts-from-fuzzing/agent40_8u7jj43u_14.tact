struct FixedSizes {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
}

contract TestFixedSizes {
    data: FixedSizes;

    init() {
        self.data = FixedSizes{
            a: 255,
            b: -32768,
            c: 4294967295,
            d: -9223372036854775808
        };
    }

    receive() {
        let tmp = self.data;
    }
}