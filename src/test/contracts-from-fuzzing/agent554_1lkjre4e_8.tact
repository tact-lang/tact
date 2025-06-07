struct IntFormats {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int32;
    e: Int as uint64;
    f: Int as int128;
}

struct OuterIntFormats {
    inner: IntFormats;
    tag: Int as uint8;
}

contract PersistIntFormats {
    data: OuterIntFormats;

    init() {
        self.data = OuterIntFormats{
            inner: IntFormats {
                a: 7, b: -8, c: 65535, d: -123456, e: 123456789, f: -16777216
            },
            tag: 42
        };
    }
}