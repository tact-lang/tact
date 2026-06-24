struct Nested {
    x: Int;
    y: Bool;
}

contract TestContract {
    s: Nested;

    init() {
        self.s = Nested{ x: 10, y: true };
    }
}