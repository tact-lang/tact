struct Nested {
    a: Int;
    b: Bool;
}

contract Test {
    x: Nested;

    init() {
        self.x = Nested{ a: 1, b: true };
    }
}