struct OptionalStrings {
    s1: String?;
    s2: String?;
    s3: String?;
}

contract OptionalStringFields {
    val: OptionalStrings;

    init() {
        self.val = OptionalStrings{s1: null, s2: "abc", s3: null};
    }
}