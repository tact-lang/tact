struct Nested {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract Test {
    n: Nested;

    init() {
        self.n = Nested{ a: null, b: null, c: true };
    }
}