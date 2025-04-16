struct OptionalWithDefaults {
    foo: Int?;
    bar: String?;
}

contract InitWithPartialDefaults {
    data: OptionalWithDefaults;
    init() {
        self.data = OptionalWithDefaults{ foo: null, bar: null };
    }
}