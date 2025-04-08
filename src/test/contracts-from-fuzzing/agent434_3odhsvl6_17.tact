struct PackedInts {
    a: Int as int8;
    b: Int as uint4;
    c: Int;
    d: Int as int16;
    e: Int as uint64;
}

contract SerializeTest {
    ints: PackedInts;

    init() {
        self.ints = PackedInts{
            a: -5,
            b: 12,
            c: 1000,
            d: -1234,
            e: 987654321
        };
    }

    receive() {}
}
