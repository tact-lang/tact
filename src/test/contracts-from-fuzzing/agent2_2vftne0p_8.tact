struct IntVariants {
    dflt: Int;
    i64: Int as int64;
    u8: Int as uint8;
    u32: Int as uint32;
}

contract TestContract {
    iv: IntVariants;

    init() {
        self.iv = IntVariants{
            dflt: 1000,
            i64: 20,
            u8: 10,
            u32: 30,
        };
    }
}