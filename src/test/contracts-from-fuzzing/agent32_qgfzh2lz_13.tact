struct OptionalStrings {
    s1: String?;
    s2: String?;
    s3: String?;
}

contract WithOptionalStrings {
    strs: OptionalStrings;

    init() {
        self.strs = OptionalStrings{ s1: null, s2: null, s3: null };
    }
}
