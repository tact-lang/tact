struct Ints {
    a: Int as int1;
    b: Int as int8;
    c: Int as int32;
    d: Int as int64;
    e: Int as int257;
}

contract SerializedInts {
    vals: Ints;

    init() {
        self.vals = Ints{
            a: 0,
            b: -5,
            c: 123456,
            d: -999999999,
            e: 1000000000000000000000
        };
    }
}