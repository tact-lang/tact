struct IntSizes {
    i8: Int as int8;
    u9: Int as uint9;
    i64: Int as int64;
    u128: Int as uint128;
    i257: Int; // default int257
}

contract VariousIntSizes {
    s: IntSizes;

    init() {
        self.s = IntSizes{
            i8: -100,
            u9: 300,
            i64: -123456789,
            u128: 123456789012345678901234567890,
            i257: -1,
        };
    }
}