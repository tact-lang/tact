struct Nested {
    inner: Bool;
}

contract NestedStructTest {
    item: Nested;

    init() {
        self.item = Nested{ inner: false };
    }
}
