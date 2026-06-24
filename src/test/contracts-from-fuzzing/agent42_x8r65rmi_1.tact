struct Nested {
    x: Int;
    y: Int?;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{ x: 1, y: null };
    }
}