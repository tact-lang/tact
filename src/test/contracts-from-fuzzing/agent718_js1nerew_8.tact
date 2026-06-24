struct SerializeInts {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint16;
    e: Int as int32;
    f: Int as uint32;
    g: Int as int64;
    h: Int as uint64;
}

contract TestContract {
    data: SerializeInts;

    init() {
        self.data = SerializeInts{
            a: -5,
            b: 5,
            c: -1234,
            d: 1234,
            e: -123456,
            f: 123456,
            g: -1234567890,
            h: 1234567890
        };
    }
}