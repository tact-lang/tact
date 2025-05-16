struct OptionalSerialization {
    x: Int? as uint8;
    y: Int? as int16;
}

contract OptSerialized {
    data: OptionalSerialization;

    init() {
        self.data = OptionalSerialization{
            x: null,
            y: 123
        };
    }
}