struct OptionalStrings {
    s1: String?;
    s2: String?;
    s3: String?;
}

contract OptStr {
    data: OptionalStrings;

    init() {
        self.data = OptionalStrings{
            s1: null,
            s2: "Hello",
            s3: null
        };
    }
}
