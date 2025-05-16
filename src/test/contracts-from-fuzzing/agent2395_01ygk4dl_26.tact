struct SerializationTestNested {
    small: Int as uint8;
    innerStr: String;
}

contract SerializeNestedTest {
    field: SerializationTestNested;

    init() {
        self.field = SerializationTestNested{
            small: 5,
            innerStr: "serialize"
        };
    }
}
