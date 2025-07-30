struct Nested {
    inner: Int?;
}

contract OptionalStructField {
    nested: Nested;

    init() {
        self.nested = Nested{ inner: null };
    }
}