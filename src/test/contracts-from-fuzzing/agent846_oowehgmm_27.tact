// lots of int width serialization
struct SerInts {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint32;
    e: Int as int64;
    f: Int as uint128;
}

contract Test {
    s: SerInts;

    init() {
        self.s = SerInts{
            a: 15,
            b: 200,
            c: -300,
            d: 500000,
            e: -123456789,
            f: 123456789123456789
        };
    }
}