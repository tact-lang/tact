struct IntSizes {
    a: Int as int64;
    b: Int as uint32;
    c: Int as int8;
    d: Int as uint4;
    e: Int;
}

contract TestContract {
    sizes: IntSizes;
    init() {
        self.sizes = IntSizes{
            a: 12345678,
            b: 1000,
            c: 127,
            d: 15,
            e: 999999999999
        };
    }
}