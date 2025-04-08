struct Inner {
    foo: Int;
    bar: Bool;
    baz: String;
}

contract NestedStructField {
    nested: Inner;

    init() {
        self.nested = Inner{
            foo: 42,
            bar: false,
            baz: "hello",
        };
    }
}