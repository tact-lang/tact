struct Nested {
    x: Int;
    y: Bool;
}

contract DeepStorage {
    s: Nested;
    n: Int;

    init() {
        self.s = Nested{ x: 5, y: true };
        self.n = 42;
    }
}