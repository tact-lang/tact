struct Nested {
    x: Int;
    y: Int?;
}

contract TestContract {
    point: Nested;

    init() {
        self.point = Nested{ x: 1, y: null };
    }
}