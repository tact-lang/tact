struct Inner {
    innerField: Int;
}

contract NestedStructTest {
    nested: Inner;

    init() {
        self.nested = Inner{ innerField: 42 };
    }
}