struct MultipleOptionalStrings {
    s1: String?;
    s2: String?;
    s3: String?;
}

contract OptionalStrings {
    data: MultipleOptionalStrings;

    init() {
        self.data = MultipleOptionalStrings{
            s1: "aaaa",
            s2: null,
            s3: "cccc"
        };
    }
}
