struct PackedInts {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint64;
    e: Int as uint1;
}

contract TestContract {
    data: PackedInts;

    init() {
        self.data = PackedInts{
            a: 5,
            b: 200,
            c: -1000,
            d: 123456,
            e: 1,
        };
    }
}