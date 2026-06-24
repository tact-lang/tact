struct OptionalStrings {
    s1: String?;
    s2: String?;
    s3: String?;
}

contract OptionalStringsTest {
    data: OptionalStrings;

    init() {
        self.data = OptionalStrings{
            s1: null,
            s2: null,
            s3: null
        };
    }
}