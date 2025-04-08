struct SerializeHints {
    weight: Int as uint8;
    size: Int as uint16;
    total: Int as int32;
    flag: Bool;
}

contract SerializationHintsTest {
    hints: SerializeHints;

    init() {
        self.hints = SerializeHints{
            weight: 255,
            size: 65535,
            total: -1234,
            flag: true
        };
    }
}
