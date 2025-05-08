struct IntVariants {
    a: Int as int4;  // very small signed
    b: Int as uint3; // very small unsigned
    c: Int as int64; // mid signed
    d: Int as uint64; // mid unsigned
    e: Int;           // default 257-bit signed
}

contract IntSerializations {
    ints: IntVariants;
    init() {
        self.ints = IntVariants{ a: 3, b: 7, c: -12345, d: 12345, e: -1 };
    }
}
