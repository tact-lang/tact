struct OptionalStrings {
    a: String?;
    b: String?;
}

contract OptionalStringsTest {
    s: OptionalStrings;

    init() {
        self.s = OptionalStrings{
            a: null,
            b: "hi"
        };
    }
}