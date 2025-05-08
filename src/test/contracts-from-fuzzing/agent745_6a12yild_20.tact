struct SerialBig {
    a: Int as int64;
    b: Int as uint64;
    c: Int as int128;
    d: Int as uint128;
    e: Int as int256;
}

contract SerialBigFields {
    bigs: SerialBig;

    init() {
        self.bigs = SerialBig{
            a: 1000,
            b: 2000,
            c: 3000,
            d: 4000,
            e: 5000
        };
    }
}