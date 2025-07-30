struct Nested {
    x: Int;
    y: Bool;
}

contract NestedStructTest {
    data: Nested = Nested{ x: 1, y: true };

    init() {
        self.data = Nested{ x: 42, y: false };
    }
}