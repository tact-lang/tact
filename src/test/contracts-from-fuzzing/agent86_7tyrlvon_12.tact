struct OptionalStrings {
    s1: String?;
    s2: String?;
    s3: String?;
}

contract PersistOptStr {
    data: OptionalStrings;
    init() {
        self.data = OptionalStrings{
            s1: "hi",
            s2: null,
            s3: "bye"
        };
    }
}