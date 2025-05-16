struct Nested { a: Int; b: Bool; }

contract TestContract {
    point: Nested;

    init() {
        self.point = Nested{ a: 1, b: true };
    }
}
