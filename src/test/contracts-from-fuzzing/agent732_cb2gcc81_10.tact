struct FullWidth {
    a: Int as uint1;
    b: Int as uint8;
    c: Int as uint16;
    d: Int as uint32;
    e: Int as uint64;
    f: Int as int1;
    g: Int as int8;
    h: Int as int16;
    i: Int as int32;
    j: Int as int64;
    k: Int as int257;
}

contract SerializationsTest {
    s: FullWidth;

    init() {
        self.s = FullWidth{
            a: 1,
            b: 255,
            c: 65535,
            d: 4294967295,
            e: 9223372036854775807,
            f: 1,
            g: 127,
            h: 32767,
            i: 2147483647,
            j: 9223372036854775807,
            k: 0
        };
    }
}