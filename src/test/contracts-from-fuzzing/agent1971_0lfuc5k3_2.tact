struct Nested {
    inner: Int;
}

contract NestedStructField {
    nested: Nested;

    init() {
        self.nested = Nested{ inner: 42 };
    }
}
