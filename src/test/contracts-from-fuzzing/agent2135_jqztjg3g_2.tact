struct Nested {
    a: Int;
    b: Bool;
}

contract NestedStructTest {
    data: Nested;

    init() {
        self.data = Nested{a: 42, b: true};
    }
}