struct OptionalSerialization {
    u8: Int? as uint8;
    s16: Int? as int16;
}

contract OptionalSerializationContract {
    data: OptionalSerialization;

    init() {
        self.data = OptionalSerialization{
            u8: null,
            s16: null,
        };
    }

    receive() {}
}