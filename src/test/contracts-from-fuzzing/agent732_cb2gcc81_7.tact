struct StringFields {
    first: String;
    second: String;
    third: String;
}

contract StringFieldsTest {
    data: StringFields;

    init() {
        self.data = StringFields{
            first: "one",
            second: "two",
            third: "three"
        };
    }
}