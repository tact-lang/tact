struct IntVariants {
    a: Int as uint8;
    b: Int as int16;
    c: Int; // full 257 bits
}

contract IntSerialization {
    data: IntVariants;

    init() {
        self.data = IntVariants{
            a:255, b:-32768, c:123456789
        };
    }
}