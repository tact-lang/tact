struct Inner {
    foo: Int;
    bar: Bool;
}

contract NestedTest {
    data: Inner;
    init() {
        self.data = Inner{ foo: 42, bar: true };
    }
}