struct StructWithSerialization {
    i64: Int as int64;
    u32: Int as uint32;
    u120: Int as uint120;
    coin: Int as coins;
    small: Int as uint4;
}

contract TestContract {
    val: StructWithSerialization;

    init() {
        self.val = StructWithSerialization{
            i64: -123456789,
            u32: 4294967295,
            u120: 1000000000000000000,
            coin: ton("1"),
            small: 12
        };
    }
}