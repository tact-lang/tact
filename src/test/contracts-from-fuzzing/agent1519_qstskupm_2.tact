struct Inner {
    foo: Int = 10;
    bar: Bool?;
}

contract NestedTest {
    data: Inner = Inner{};

    init() {
        self.data = Inner{ foo: 20, bar: true };
    }
}