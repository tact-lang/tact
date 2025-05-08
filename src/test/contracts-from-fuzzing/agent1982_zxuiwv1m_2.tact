struct Nested {
    x: Int;
    y: Int?;
}

contract NestedField {
    nested: Nested;

    init() {
        self.nested = Nested{ x: 5, y: null };
    }
}