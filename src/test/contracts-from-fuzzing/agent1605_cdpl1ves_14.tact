struct EmptyOptionalStrings {
    s1: String?;
    s2: String?;
    s3: String?;
}

contract EmptyOptionalStringsTest {
    data: EmptyOptionalStrings;

    init() {
        self.data = EmptyOptionalStrings{
            s1: null,
            s2: null,
            s3: null,
        };
    }
}