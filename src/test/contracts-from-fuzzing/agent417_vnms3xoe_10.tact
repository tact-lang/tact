struct OptionalStrings {
    s1: String?;
    s2: String?;
    s3: String?;
}

contract OptionalStringsContract {
    persistent: OptionalStrings;

    init() {
        self.persistent = OptionalStrings{
            s1: "hello",
            s2: null,
            s3: "world",
        };
    }
}