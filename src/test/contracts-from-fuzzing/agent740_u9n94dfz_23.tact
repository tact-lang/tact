struct StringFields {
    s1: String;
    s2: String;
    s3: String;
}

contract StringFieldsTest {
    data: StringFields;

    init() {
        self.data = StringFields{
            s1: "a",
            s2: "b",
            s3: "c",
        };
    }
}