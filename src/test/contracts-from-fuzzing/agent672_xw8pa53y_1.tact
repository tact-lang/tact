struct Inner {
    foo: Int;
    bar: Bool;
    baz: String;
}

contract NestedStructTest {
    data: Inner;
    init() {
        self.data = Inner{ foo: 42, bar: false, baz: "abc" };
    }
}
