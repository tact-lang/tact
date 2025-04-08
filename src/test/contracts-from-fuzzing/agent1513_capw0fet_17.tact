struct OptionalNestedStrings {
    s1: String?;
    s2: String?;
}

contract OptStrings {
    data: OptionalNestedStrings;

    init() {
        self.data = OptionalNestedStrings { s1: null, s2: "world" };
    }
}