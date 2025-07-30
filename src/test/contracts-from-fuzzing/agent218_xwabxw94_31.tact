struct ManyInts {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint128;
    f: Int;
}

contract WideStruct {
    data: ManyInts;

    init() {
        self.data = ManyInts{
            a: 1,
            b: -32768,
            c: 123456,
            d: -12345678901234,
            e: 340282366920938463463374607431768211455, // max 128bit unsigned
            f: -1000000000000000000000000000000
        };
    }
}