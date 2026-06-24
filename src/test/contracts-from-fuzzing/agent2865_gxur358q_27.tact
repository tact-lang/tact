struct OptionalStrings {
    text1: String?;
    text2: String?;
}

contract OptStringsTest {
    field: OptionalStrings;

    init() {
        self.field = OptionalStrings{
            text1: null,
            text2: "hello"
        };
    }
}