struct Nested {
    x: Int;
    y: Bool;
}

contract TestContract {
    nested: Nested;
    init() {
        self.nested = Nested{ x: 42, y: true };
    }
}