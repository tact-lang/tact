struct SerialFormats {
    a: Int as uint8;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int16;
    e: Int as uint32;
    f: Int as int32;
    g: Int as uint64;
    h: Int as int64;
    i: Int as uint128;
    j: Int as int128;
}

contract SerialFormatsTest {
    s: SerialFormats;

    init() {
        self.s = SerialFormats{
            a: 1,
            b: -2,
            c: 3,
            d: -4,
            e: 5,
            f: -6,
            g: 7,
            h: -8,
            i: 9,
            j: -10
        };
    }
}