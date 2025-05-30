struct Nested {
    a: Int;
    b: Bool;
    s: String;
}

contract Test {
    nested: Nested;

    init() {
        self.nested = Nested{ a: 1, b: true, s: "ok" };
    }
}
