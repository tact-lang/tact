struct OptionalStrings {
    s1: String? = null;
    s2: String? = null;
    s3: String? = null;
}

contract NullStrings {
    val: OptionalStrings;

    init() {
        self.val = OptionalStrings{};
    }
}
