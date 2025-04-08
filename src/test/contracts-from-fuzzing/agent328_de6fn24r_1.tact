struct Nested {
    x: Int;
    y: Int;
}

contract Test {
    foo: Nested;
    init() {
        self.foo = Nested{ x: 1, y: 2 };
    }
}