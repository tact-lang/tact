struct Nested {
    inner: Int?;
}

contract NestedOptionalField {
    nested: Nested;

    init() {
        self.nested = Nested{
            inner: null,
        };
    }

    receive() {
        if (self.nested.inner == null) {
            self.nested = Nested{
                inner: 123,
            };
        }
    }
}