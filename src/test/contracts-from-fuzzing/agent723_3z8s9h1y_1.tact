struct Nested {
    x: Int;
    y: Bool;
}

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{ x: 5, y: true };
    }
}