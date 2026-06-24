struct Nested {
    a: Int;
    b: Int?;
}

contract NestedStructStorage {
    nested: Nested;
    init() {
        self.nested = Nested{ a: 1, b: 2 };
    }
}