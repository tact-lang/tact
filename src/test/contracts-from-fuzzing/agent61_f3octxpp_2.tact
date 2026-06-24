struct Nested {
    x: Int;
    y: Int;
}

contract NestedStructTest {
    nested: Nested;

    init() {
        self.nested = Nested{ x:1, y:2 };
    }
}