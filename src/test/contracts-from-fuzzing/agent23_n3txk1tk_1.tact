struct Nested {
    x: Int;
    y: Bool;
}

contract TestContract {
    field: Nested;
    init() {
        self.field = Nested{ x: 1, y: true };
    }
}