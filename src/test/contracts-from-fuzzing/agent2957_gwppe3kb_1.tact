struct Nested {
    a: Int;
    b: Int?;
    c: Bool;
}

contract Test {
    data: Nested;
    init() {
        self.data = Nested{ a: 1, b: null, c: true };
    }
}