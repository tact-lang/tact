struct Serialize {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
    d: Int as int8;
    e: Int as int16;
    f: Int as int32;
}

contract SerSizes {
    data: Serialize;

    init() {
        self.data = Serialize{
            a: 1,
            b: 2,
            c: 3,
            d: -1,
            e: -2,
            f: -3
        };
    }
}
