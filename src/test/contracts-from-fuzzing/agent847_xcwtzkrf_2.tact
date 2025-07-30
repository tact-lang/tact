struct Nested {
    x: Int;
    y: Bool;
}

contract DeepTest {
    point: Nested;

    init() {
        self.point = Nested{ x: 5, y: false };
    }
}