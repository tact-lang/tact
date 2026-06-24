struct Nested {
    x: Int;
    y: Int;
}

contract Test {
    a: Nested;
    init() {
        self.a = Nested { x: 1, y: 2 };
    }
}