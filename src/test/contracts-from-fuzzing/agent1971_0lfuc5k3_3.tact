struct Nested {
    inner: Int;
    optional: Bool?;
}

contract OptionalNestedField {
    nested: Nested;

    init() {
        self.nested = Nested{ inner: 10, optional: null };
    }
}
