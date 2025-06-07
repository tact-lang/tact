struct IntVariants {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint32;
    d: Int as int256;
    e: Int;
}

contract SerializedInts {
    data: IntVariants;

    init() {
        self.data = IntVariants{
            a: 7,
            b: -8,
            c: 123,
            d:-2048,
            e:42,
        };
    }
}
