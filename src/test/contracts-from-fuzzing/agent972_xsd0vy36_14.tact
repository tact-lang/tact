struct PackedInts {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint4;
}

contract TestPackedInts {
    storage: PackedInts;

    init() {
        self.storage = PackedInts{
            a: 255,
            b: 65535,
            c: 4294967295,
            d: 123456789,
            e: 15,
        };
    }
}
