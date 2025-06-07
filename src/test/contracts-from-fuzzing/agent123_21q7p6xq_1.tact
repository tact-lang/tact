struct Nested { x: Int; y: Bool; }

contract TestContract {
    point: Nested;

    init() {
        self.point = Nested{ x: 1, y: true };
    }
}