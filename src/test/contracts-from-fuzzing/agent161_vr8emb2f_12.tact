struct OptionalStrings {
    s1: String?;
    s2: String?;
    s3: String?;
}

contract TestOptionalStrings {
    val: OptionalStrings;

    init() {
        self.val = OptionalStrings{
            s1: null,
            s2: null,
            s3: null,
        };
    }
}
