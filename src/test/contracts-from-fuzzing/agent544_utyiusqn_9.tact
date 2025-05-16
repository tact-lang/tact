struct SerializeTest {
    a: Int as int4;
    b: Int as uint4;
    c: Int as int8;
    d: Int as uint8;
    e: Int as int16;
    f: Int as uint16;
    g: Int as int32;
    h: Int as uint32;
}

contract TestContract {
    s: SerializeTest;

    init() {
        self.s = SerializeTest{
            a: -8,
            b: 15,
            c: -128,
            d: 255,
            e: -32768,
            f: 65535,
            g: -2147483648,
            h: 4294967295,
        };
    }
}