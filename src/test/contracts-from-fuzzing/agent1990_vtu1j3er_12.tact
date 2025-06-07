struct IntSizes {
    i4: Int as int4;
    u8: Int as uint8;
    i64: Int as int64;
    u128: Int as uint128;
    i257: Int as int257;
}

contract SerializationTest {
    ints: IntSizes;

    init() {
        self.ints = IntSizes{
            i4: -3,
            u8: 250,
            i64: -5000000,
            u128: 340282366920938463463374607431768211455,
            i257: -1
        };
    }
}
