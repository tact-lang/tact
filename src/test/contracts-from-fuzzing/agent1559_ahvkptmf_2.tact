struct Nested {
    x: Int;
    y: Bool;
}

contract TestContract {
    data: Nested;
    init() {
        self.data = Nested{ x: 10, y: true };
    }
}