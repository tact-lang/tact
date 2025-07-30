struct Nested {
    x: Int;
    y: Int?;
}

contract TestContract {
    pair: Nested;

    init() {
        self.pair = Nested{ x: 1, y: null };
    }
}