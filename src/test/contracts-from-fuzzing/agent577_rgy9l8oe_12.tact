struct VariantSerialization {
    a: Int as uint8;
    b: Int as int32;
    c: Int as uint64;
    d: Int as int256;
    e: Int;
}

contract TestContract {
    s: VariantSerialization;
    init() {
        self.s = VariantSerialization{
            a: 255,
            b: -1000,
            c: 50000,
            d: -42,
            e: 123
        };
    }
}