struct WithSerialization {
    si8: Int as int8;
    su8: Int as uint8;
    si32: Int as int32;
    su64: Int as uint64;
}

contract SerializationTest {
    data: WithSerialization;

    init() {
        self.data = WithSerialization{
            si8: 1,
            su8: 2,
            si32: 3,
            su64: 4,
        };
    }
}