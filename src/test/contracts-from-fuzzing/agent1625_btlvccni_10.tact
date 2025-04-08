struct OptionalStrings {
    s1: String?;
    s2: String?;
}

contract OptionalStringPersist {
    val: OptionalStrings;

    init() {
        self.val = OptionalStrings{
            s1: null,
            s2: null
        };
    }
}
