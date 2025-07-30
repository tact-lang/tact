struct IntSerialization {
    s257: Int;
    s64: Int as int64;
    u64: Int as uint64;
    s8: Int as int8;
    u8: Int as uint8;
}

contract IntSerializationContract {
    data: IntSerialization;

    init() {
        self.data = IntSerialization{
            s257: 1,
            s64: 2,
            u64: 3,
            s8: 4,
            u8: 5,
        };
    }

    receive() {}
}