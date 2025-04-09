struct Inner {
    a: Int;
    b: Bool;
}

contract NestedStructTest {
    nested: Inner;

    init() {
        self.nested = Inner{ a: 44, b: false };
    }
}
