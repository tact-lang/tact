struct WithSerialization {
    i8: Int as int8;
    u32: Int as uint32;
    coins: Int as coins;
    flag: Bool;
}

contract SerializationFields {
    data: WithSerialization;

    init() {
        self.data = WithSerialization {
            i8: -5,
            u32: 123456,
            coins: ton("1"),
            flag: true
        };
    }
}
