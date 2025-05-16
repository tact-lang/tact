struct Nested { inner: Int; }

contract Test {
    nested: Nested;

    init() {
        self.nested = Nested{ inner: 5 };
    }
}