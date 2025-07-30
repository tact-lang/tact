struct SerializeTest {
    small: Int as uint8;
    big: Int as int257;
}

contract SerializationEdgeCase {
    s: SerializeTest;

    init() {
        self.s = SerializeTest{
            small: 255,
            big: -1,
        };
    }
}