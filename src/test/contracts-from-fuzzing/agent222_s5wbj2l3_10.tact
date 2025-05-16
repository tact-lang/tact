struct EmbeddedStrings {
    field1: String;
    field2: String?;
    field3: NestedString;
}

struct NestedString {
    text: String?;
}

contract StringFieldsTest {
    data: EmbeddedStrings;

    init() {
        self.data = EmbeddedStrings{
            field1: "hello",
            field2: null,
            field3: NestedString{ text: "world" }
        };
    }
}