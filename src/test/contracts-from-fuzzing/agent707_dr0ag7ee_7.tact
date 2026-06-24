struct TinyBits {
    a: Int as uint1;
    b: Int as int4;
    c: Int as uint8;
    d: Int as int16;
    e: Bool;
    f: Int;
    g: Int?;
}

contract SmallIntsTest {
    sb: TinyBits;
    init() {
        self.sb = TinyBits{
            a: 1,
            b: -7,
            c: 255,
            d: -12345,
            e: true,
            f: 123456,
            g: null,
        };
    }
}