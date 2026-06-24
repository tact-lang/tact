struct StringFields {
    s1: String;
    s2: String;
}

contract StringFieldsTest {
    data: StringFields;

    init() {
        self.data = StringFields {
            s1: "Hello",
            s2: "World"
        };
    }
}