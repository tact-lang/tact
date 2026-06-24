struct OptionalStrings {
    s1: String?;
    s2: String?;
    s3: String?;
}

contract NullableText {
    opt: OptionalStrings;

    init() {
        self.opt = OptionalStrings{
            s1: null,
            s2: "hi",
            s3: null
        };
    }
}
