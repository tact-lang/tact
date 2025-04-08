struct Nested { inner: Int; outer: Int?; }

contract Test {
    nestedField: Nested;

    init() {
        self.nestedField = Nested{ inner: 1, outer: null };
    }
}