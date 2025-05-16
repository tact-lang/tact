struct Nested {
    x: Int;
    y: Bool;
    s: String;
}

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{ x: 1, y: true, s: "abc" };
    }
}
