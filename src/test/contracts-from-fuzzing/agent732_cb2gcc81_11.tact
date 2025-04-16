struct OptionalSerialization {
    x: Int? as uint8;
    y: Int? as int16;
    z: Bool?;
}

contract OptionalSerializationTest {
    data: OptionalSerialization;

    init() {
        self.data = OptionalSerialization{
            x: 123,
            y: null,
            z: true
        };
    }
}