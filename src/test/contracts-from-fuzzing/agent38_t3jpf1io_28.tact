struct OptionalStrings {
    s1: String?;
    s2: String?;
}

contract OptStringsContract {
    info: OptionalStrings;

    init() {
        self.info = OptionalStrings{
            s1: null,
            s2: "hello",
        };
    }
}