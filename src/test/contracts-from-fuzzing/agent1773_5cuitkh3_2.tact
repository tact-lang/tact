struct Inner {
    a: Int;
    b: Int;
}

contract NestedStructTest {
    nested: Inner;

    init() {
        self.nested = Inner{ a: 10, b: 20 };
    }
}