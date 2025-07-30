struct OptionalSerialization {
    a: Int? as uint8;
    b: Int? as int8;
}

contract OptionalSerializationStruct {
    data: OptionalSerialization;

    init() {
        self.data = OptionalSerialization{
            a: null,
            b: null,
        };
    }
}