struct IntFormats {
    a: Int as uint1;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint32;
    e: Int as int64;
    f: Int as uint128;
    g: Int as int257;
}

contract UseStruct {
    data: IntFormats;

    init() {
        self.data = IntFormats{
            a: 1,
            b: 255,
            c: -12345,
            d: 1234567890,
            e: -9876543210,
            f: 12345678901234567890,
            g: -1
        };
    }
}