struct Nested {
    inner: Int;
}

contract Test {
    value: Nested;

    init() {
        self.value = Nested{ inner: 42 };
    }
}