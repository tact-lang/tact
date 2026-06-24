struct Nested {
    inner: Bool;
    count: Int;
}

contract NestedStructTest {
    ns: Nested;

    init() {
        self.ns = Nested{ inner: true, count: 5 };
    }
}