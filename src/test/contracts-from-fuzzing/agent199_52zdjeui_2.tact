struct Inner {
    foo: Int;
    bar: Bool;
    baz: String;
}

contract NestedStructField {
    inner: Inner;

    init() {
        self.inner = Inner{
            foo: 42,
            bar: true,
            baz: "Hello",
        };
    }
}