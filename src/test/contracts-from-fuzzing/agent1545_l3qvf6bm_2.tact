struct Nested {
    x: Int;
    y: Bool;
}

contract NestedStructsTest {
    data: Nested;

    init() {
        self.data = Nested{ x: 10, y: false };
    }

    receive() {}
}