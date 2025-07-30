struct WithSerialization {
    int8: Int as int8;
    uint32: Int as uint32;
    int64: Int as int64;
    flag: Bool;
    optValue: Int?;
}

contract SerializationTest {
    val: WithSerialization;

    init() {
        self.val = WithSerialization{
            int8: 5,
            uint32: 123456,
            int64: -9876543210,
            flag: true,
            optValue: null,
        };
    }
}