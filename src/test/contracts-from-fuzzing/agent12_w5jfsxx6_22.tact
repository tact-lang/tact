struct Nested {
    x: Int;
}

contract InitNestedField {
    n: Nested;

    init() {
        self.n = Nested{ x: 99 };
    }
}