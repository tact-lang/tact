struct IntSizes {
    a: Int as int8;
    b: Int as int32;
    c: Int as uint8;
    d: Int as uint64;
    e: Int as int257;
}

contract IntSerialization {
    data: IntSizes;

    init() {
        self.data = IntSizes{
            a: -10,
            b: 12345,
            c: 25,
            d: 12345678,
            e: 42
        };
    }
}