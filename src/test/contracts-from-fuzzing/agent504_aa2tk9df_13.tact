struct SerializeTest {
    small: Int as uint8;
    med: Int as int16;
    large: Int as uint128;
}

contract SerializationEdge {
    s: SerializeTest;

    init() {
        self.s = SerializeTest{
            small: 5,
            med: -123,
            large: 1234567890123456789,
        };
    }
}