struct OptionalWithSerialization {
    i8: Int? as int8;
    u4: Int? as uint4;
}

contract OptionalSerde {
    s: OptionalWithSerialization;

    init() {
        self.s = OptionalWithSerialization{
            i8: null,
            u4: 7
        };
    }
}