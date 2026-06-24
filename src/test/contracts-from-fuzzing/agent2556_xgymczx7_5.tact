struct SerializeSizes {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint16;
    e: Int as int32;
    f: Int as uint32;
    g: Int as int64;
    h: Int as uint64;
    i: Int as int128;
    j: Int as uint128;
    k: Int as int257;
}

contract SerializeFieldsContract {
    data: SerializeSizes;

    init() {
        self.data = SerializeSizes {
            a: -1,
            b: 1,
            c: -1000,
            d: 1000,
            e: -2000000,
            f: 2000000,
            g: -5000000000,
            h: 5000000000,
            i: -10000000000000000,
            j: 10000000000000000,
            k: -123456789
        };
    }
}