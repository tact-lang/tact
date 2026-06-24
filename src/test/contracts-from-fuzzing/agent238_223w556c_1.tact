struct Nested {
    a: Int;
    b: Bool;
}

contract NestedFieldTest {
    data: Nested;

    init() {
        self.data = Nested{ a: 1, b: true };
    }
}