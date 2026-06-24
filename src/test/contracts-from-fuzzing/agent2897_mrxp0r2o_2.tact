struct Nested {
    a: Int;
    b: Bool;
}

contract NestedStructTest {
    pair: Nested;
    init() {
        self.pair = Nested{a: 1, b: false};
    }
}