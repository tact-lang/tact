struct Sizes {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int32;
    e: Int as uint64;
}

contract SerializeStruct {
    s: Sizes;

    init() {
        self.s = Sizes{
            a: 7,
            b: -5,
            c: 12345,
            d: -123456,
            e: 987654321
        };
    }
}