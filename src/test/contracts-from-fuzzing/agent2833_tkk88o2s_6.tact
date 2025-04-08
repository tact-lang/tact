struct Inner {
    foo: Int;
    bar: Bool?;
    baz: String;
}

contract DeepWithOpts {
    nested1: Inner;
    nested2: Inner;

    init() {
        self.nested1 = Inner{ foo: 1, bar: null, baz: "a" };
        self.nested2 = Inner{ foo: 2, bar: true, baz: "b" };
    }
}