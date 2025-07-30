struct OptionalSerialized {
    a: Int? as uint8;
    b: Int? as int16;
    c: Int? as uint32;
}

contract OptionalSerialization {
    data: OptionalSerialized;
    init() {
        self.data = OptionalSerialized{
            a: null,
            b: -12345,
            c: 123456,
        };
    }
}