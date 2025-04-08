struct SimpleNested {
    inner: Nested;
}

struct Nested {
    x: Int;
    y: Int;
}

contract NestedStructTest {
    data: SimpleNested;

    init() {
        self.data = SimpleNested{ inner: Nested{ x: 1, y: 2 } };
    }
}
