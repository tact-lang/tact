struct Nested { value: Int; }

contract Test {
    inner: Nested;

    init() {
        self.inner = Nested{ value: 42 };
    }
}
