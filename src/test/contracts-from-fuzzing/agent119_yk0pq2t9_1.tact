struct Nested { x: Int; y: Int?; }

contract TestContract {
    point: Nested;
    value: Int = 1;

    init() {
        self.point = Nested{ x: 10, y: null };
        self.value = 5;
    }
}