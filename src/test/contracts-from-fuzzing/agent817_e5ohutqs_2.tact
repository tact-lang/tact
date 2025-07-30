struct Nested {
    a: Int;
    b: Bool;
}

contract Test {
    data: Nested;

    init() {
        self.data = Nested{ a: 10, b: true };
    }
}