struct Nested {
    a: Int;
    b: Bool;
}

contract Test {
    inner: Nested;

    init() {
        self.inner = Nested{ a: 4, b: true };
    }
}
