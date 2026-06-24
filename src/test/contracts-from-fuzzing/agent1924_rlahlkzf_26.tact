struct IntsOfVariousSerialization {
    d: Int;
    u8: Int as uint8;
    i32: Int as int32;
    u64: Int as uint64;
}

contract TestContract {
    content: IntsOfVariousSerialization;

    init() {
        self.content = IntsOfVariousSerialization{
            d: -5,
            u8: 255,
            i32: -100000,
            u64:123456789
        };
    }
}