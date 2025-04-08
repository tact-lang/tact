struct MultiSerialStrings {
    name: String;
    comment: String;
    emptyStr: String;
}

contract StringsTest {
    data: MultiSerialStrings;

    init() {
        self.data = MultiSerialStrings{
            name: "Alice",
            comment: "Sample",
            emptyStr: "",
        };
    }
}
