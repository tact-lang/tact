struct SerializeTest {
    small: Int as uint8;
    medium: Int as int16;
    large: Int as int257;
}

contract SerializationTest {
    x: SerializeTest;

    init() {
        self.x = SerializeTest{
            small: 1,
            medium: -1234,
            large: 9999999999
        };
    }
}