struct Nested {
    x: Int;
    y: Bool;
}

contract Test {
    n: Nested;

    init() {
        self.n = Nested{ x: 7, y: true };
    }
}
