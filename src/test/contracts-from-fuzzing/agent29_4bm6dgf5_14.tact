struct StringFields {
    s: String;
    o: String?;
}

contract StringFieldsTest {
    data: StringFields;

    init() {
        self.data = StringFields{
            s: "hello",
            o: null,
        };
    }
}