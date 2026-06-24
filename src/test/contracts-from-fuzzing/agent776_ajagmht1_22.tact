struct StringFields {
    s1: String;
    s2: String;
    s3: String;
}

contract StringFieldsTest {
    data: StringFields;
    init() {
        self.data = StringFields{
            s1: "foo",
            s2: "bar",
            s3: "baz"
        };
    }
}