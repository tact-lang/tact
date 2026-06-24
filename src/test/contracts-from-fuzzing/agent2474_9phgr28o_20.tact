struct OptionalStrings {
    s1: String?;
    s2: String?;
    s3: String?;
}

contract ImplicitNullOptionals {
    text: OptionalStrings;

    init() {
        self.text = OptionalStrings{};
    }
}
