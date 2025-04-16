struct PackedPrimitives {
    a: Int as uint4;
    b: Int as uint32;
    c: Int as int64;
    d: Int as uint1;
}

contract Test {
    data: PackedPrimitives;
    init() {
        self.data = PackedPrimitives{
            a: 7,
            b: 123456,
            c: -1000,
            d: 1
        };
    }
}