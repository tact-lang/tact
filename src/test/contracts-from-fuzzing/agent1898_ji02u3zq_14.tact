struct FixedTypes {
    i8: Int as int8;
    u8: Int as uint8;
    i64: Int as int64;
    u64: Int as uint64;
    coinsVal: Int as coins;
}

contract FixedTypeFields {
    x: FixedTypes;

    init() {
        self.x = FixedTypes{
            i8: -5,
            u8: 250,
            i64: -12345678,
            u64: 12345678,
            coinsVal: 1000000000
        };
    }
}