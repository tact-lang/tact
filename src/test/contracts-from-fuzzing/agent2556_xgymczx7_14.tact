struct IntManySizes {
    a: Int as int1;
    b: Int as uint1;
    c: Int as int64;
    d: Int as uint64;
    e: Int as int256;
    f: Int as uint256;
}

contract IntSizesContract {
    data: IntManySizes;

    init() {
        self.data = IntManySizes{
            a: 0,
            b: 1,
            c: -100000000000,
            d: 100000000000,
            e: -1000000000000000000000000,
            f: 1000000000000000000000000
        };
    }
}
