contract OptionalNestedField {
    nested: Nested?;

    init() {
        self.nested = Nested{
            inner: 2024
        };
    }
}

struct Nested {
    inner: Int;
}