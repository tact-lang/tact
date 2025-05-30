struct SerializeVariants {
    int8: Int as int8;
    uint8: Int as uint8;
    int64: Int as int64;
    uint64: Int as uint64;
    coins: Int as coins;
}

contract SerializationTest {
    s: SerializeVariants;

    init() {
        self.s = SerializeVariants{
            int8: -10,
            uint8: 250,
            int64: -1000000,
            uint64: 1000000,
            coins: 123456789
        };
    }
}
