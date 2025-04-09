struct SerializeMix {
    a: Int as uint3;
    b: Int as int4;
    c: Int as uint8;
    d: Int as int16;
    e: Int as uint32;
    f: Int as int64;
    g: Int as uint128;
    h: Int as int257;
}

contract TestContract {
    s: SerializeMix;

    init() {
        self.s = SerializeMix{
            a: 7,
            b: -8,
            c: 255,
            d: -12345,
            e: 4294967295,
            f: -1234567890,
            g: 340282366920938463463374607431768211455,
            h: -1
        };
    }
}