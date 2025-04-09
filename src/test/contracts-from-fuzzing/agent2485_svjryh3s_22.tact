struct PackedPrimitives {
    a: Int as uint8;
    b: Int as int8;
    c: Int as uint4;
    d: Bool;
    e: Bool;
}

contract TightPacking {
    data: PackedPrimitives;

    init() {
        self.data = PackedPrimitives{
            a: 1,
            b: -1,
            c: 7,
            d: true,
            e: false
        };
    }
}