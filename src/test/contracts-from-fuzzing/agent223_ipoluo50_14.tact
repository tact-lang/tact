struct WithSerialization {
    s8: Int as int8;
    u16: Int as uint16;
    s257: Int as int257;
    u4: Int as uint4;
}

contract SerializationStructTest {
    data: WithSerialization;

    init() {
        self.data = WithSerialization{
            s8: -10,
            u16: 42,
            s257: -1000000,
            u4: 7
        };
    }
}