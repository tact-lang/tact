struct OptionalStrings {
    s1: String?;
    s2: String?;
}

contract OptStrings {
    s: OptionalStrings?;

    init() {
        self.s = OptionalStrings{
            s1: "hi",
            s2: null
        };
    }
}