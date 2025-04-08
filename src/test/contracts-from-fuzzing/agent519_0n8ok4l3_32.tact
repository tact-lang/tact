struct HasOptionalStrings {
    s1: String?;
    s2: String?;
}

contract OptionalStringsTest {
    data: HasOptionalStrings;

    init() {
        self.data = HasOptionalStrings{
            s1: null,
            s2: null
        };
    }
}